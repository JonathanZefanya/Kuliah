import cv2 
import numpy as np
import os

# Set seed untuk memastikan hasil konsisten
np.random.seed(42)

# Membuat folder untuk menyimpan gambar binary
os.makedirs("binary_images", exist_ok=True)

# Konversi gambar RGB/Grayscale menjadi binary
def convert_to_binary(image_path, output_path):
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
    _, binary_img = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)
    resized_img = cv2.resize(binary_img, (28, 28))
    cv2.imwrite(output_path, resized_img)

# Daftar gambar input
image_files = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]

# Proses setiap gambar
for idx, image_file in enumerate(image_files):
    output_file = f"binary_images/binary_image_{idx + 1}.png"
    convert_to_binary(image_file, output_file)
    print(f"Gambar {image_file} telah dikonversi dan disimpan sebagai {output_file}")
print("")

# Fungsi untuk Convolution
def conv2d(input_matrix, kernel, stride=1, padding=0):
    input_padded = np.pad(input_matrix, ((padding, padding), (padding, padding)), mode='constant')
    kernel_h, kernel_w = kernel.shape
    output_h = (input_padded.shape[0] - kernel_h) // stride + 1
    output_w = (input_padded.shape[1] - kernel_w) // stride + 1
    output = np.zeros((output_h, output_w))
    
    for i in range(0, output_h):
        for j in range(0, output_w):
            region = input_padded[i*stride:i*stride+kernel_h, j*stride:j*stride+kernel_w]
            output[i, j] = np.sum(region * kernel)
    
    print(f"Convolution Output Shape: {output.shape}")
    return output

# Fungsi untuk Batch Normalization
def batch_norm(feature_map):
    mean = np.mean(feature_map)
    variance = np.var(feature_map)
    normalized = (feature_map - mean) / np.sqrt(variance + 1e-5)
    print(f"Batch Normalization Mean: {mean}, Variance: {variance}")
    return normalized

# Fungsi untuk Activation (ReLU)
def relu(x):
    print(f"ReLU Activation Applied")
    return np.maximum(0, x)

# Fungsi untuk Pooling
def max_pooling(input_matrix, size=2, stride=2):
    output_h = (input_matrix.shape[0] - size) // stride + 1
    output_w = (input_matrix.shape[1] - size) // stride + 1
    output = np.zeros((output_h, output_w))
    
    for i in range(0, output_h):
        for j in range(0, output_w):
            region = input_matrix[i*stride:i*stride+size, j*stride:j*stride+size]
            output[i, j] = np.max(region)
    
    print(f"Max Pooling Output Shape: {output.shape}")
    return output

# Fungsi untuk Residual Block
def residual_block(input_matrix, kernel1, kernel2):
    padding1 = (kernel1.shape[0] - 1) // 2
    padding2 = (kernel2.shape[0] - 1) // 2
    
    conv1 = relu(batch_norm(conv2d(input_matrix, kernel1, padding=padding1)))
    conv2 = batch_norm(conv2d(conv1, kernel2, padding=padding2))
    result = relu(input_matrix + conv2)
    print(f"Residual Block Output Shape: {result.shape}")
    return result

# Fungsi untuk ResNet50
def resnet50(input_image):
    print("=== ResNet50 Start ===")
    total_layers = 0

    # Conv1
    kernel = np.random.randn(7, 7)
    conv1 = conv2d(input_image, kernel, stride=2, padding=3)
    conv1 = relu(batch_norm(conv1))
    conv1 = max_pooling(conv1, size=3, stride=2)
    total_layers += 1

    # Residual Blocks
    for i in range(3):  # Conv2_x
        print(f"Conv2_x Block {i+1}")
        conv1 = residual_block(conv1, np.random.randn(3, 3), np.random.randn(3, 3))
        total_layers += 2

    for i in range(4):  # Conv3_x
        print(f"Conv3_x Block {i+1}")
        conv1 = residual_block(conv1, np.random.randn(3, 3), np.random.randn(3, 3))
        total_layers += 2

    for i in range(6):  # Conv4_x
        print(f"Conv4_x Block {i+1}")
        conv1 = residual_block(conv1, np.random.randn(3, 3), np.random.randn(3, 3))
        total_layers += 2

    for i in range(3):  # Conv5_x
        print(f"Conv5_x Block {i+1}")
        conv1 = residual_block(conv1, np.random.randn(3, 3), np.random.randn(3, 3))
        total_layers += 2

    # Global Average Pooling
    global_avg_pool = np.mean(conv1, axis=(0, 1))
    print(f"Global Average Pooling Output Shape: {global_avg_pool.shape}")

    # Fully Connected Layer
    output = np.dot(global_avg_pool, np.random.randn(global_avg_pool.size))
    print(f"Total Layers in ResNet50: {total_layers}")
    print("=== ResNet50 End ===\n")
    return output, total_layers

# Input gambar binary 28x28
input_image = np.random.randint(0, 2, (28, 28))

# Jalankan ResNet50
output, total_layers = resnet50(input_image)

print("Output dari ResNet50:", output)
print("Total Layers yang Dilewati:", total_layers)

# Fungsi aktivasi sigmoid
def sigmoid(x):
    return 1 / (1 + np.exp(-x))

# Turunan sigmoid untuk backpropagation
def sigma(x):
    return x * (1 - x)

# Fungsi loss MSE
def mse_loss(y_true, y_pred):
    return np.mean((y_true - y_pred) ** 2)

# Forward propagation
def forward_propagation(X, weights, biases):
    layer_inputs = []
    layer_outputs = [X]

    for w, b in zip(weights, biases):
        z = np.dot(layer_outputs[-1], w) + b
        a = sigmoid(z)
        layer_inputs.append(z)
        layer_outputs.append(a)

    return layer_inputs, layer_outputs

# Backward propagation
def backward_propagation(X, y, weights, biases, layer_inputs, layer_outputs, learning_rate):
    errors = [layer_outputs[-1] - y]  # Error di output layer
    deltas = [errors[-1] * sigma(layer_outputs[-1])]

    # Hitung delta untuk setiap lapisan tersembunyi
    for i in range(len(weights) - 1, 0, -1):
        error = np.dot(deltas[-1], weights[i].T)
        delta = error * sigma(layer_outputs[i])
        errors.append(error)
        deltas.append(delta)

    deltas.reverse()

    # Update bobot dan bias
    for i in range(len(weights)):
        weights[i] -= learning_rate * np.dot(layer_outputs[i].T, deltas[i])
        biases[i] -= learning_rate * np.sum(deltas[i], axis=0, keepdims=True)

    return weights, biases

# Fungsi pelatihan
def train(X, y, layer_sizes, epochs, learning_rate):
    weights = [np.random.randn(layer_sizes[i], layer_sizes[i + 1]) for i in range(len(layer_sizes) - 1)]
    biases = [np.random.randn(1, layer_sizes[i + 1]) for i in range(len(layer_sizes) - 1)]

    for epoch in range(epochs):
        # Forward propagation
        layer_inputs, layer_outputs = forward_propagation(X, weights, biases)

        # Backward propagation
        weights, biases = backward_propagation(X, y, weights, biases, layer_inputs, layer_outputs, learning_rate)

        # Hitung loss
        loss = mse_loss(y, layer_outputs[-1])
        if epoch % 100 == 0 or epoch == epochs - 1:
            print(f"Epoch {epoch + 1}/{epochs}, Loss: {loss:.6f}")

    return weights, biases

# Fungsi prediksi
def predict(X, weights, biases):
    _, layer_outputs = forward_propagation(X, weights, biases)
    return layer_outputs[-1]

# Dataset contoh (AND gate)
X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
y = np.array([[0], [0], [0], [1]])

# Hyperparameter
layer_sizes = [2, 2, 1]  # Input, Hidden, Output
epochs = 1000
learning_rate = 0.1

# Latih model
weights, biases = train(X, y, layer_sizes, epochs, learning_rate)

# Prediksi
predictions = predict(X, weights, biases)
print("\nPrediksi:")
print(predictions)

# ===================================================== Soal 2 ==================================================#
# 2. Jelaskan semua layer yang dibutuhkan untuk ResNet50, termasuk layer yang ada pada CNN!
# ResNet50 adalah arsitektur Convolutional Neural Network (CNN) yang terdiri dari 50 lapisan, dirancang untuk tugas klasifikasi dan ekstraksi fitur. Berikut adalah penjelasan tentang setiap lapisan yang ada:

# a. Layer pada CNN
# Convolutional Layer:
# Melakukan operasi konvolusi untuk mengekstrak fitur dari input (misalnya tepi, tekstur).
# Parameter: ukuran kernel (misalnya 3x3, 7x7), stride, padding.

# Batch Normalization:
# Normalisasi nilai output dari lapisan sebelumnya untuk mempercepat pelatihan dan stabilitas.

# Activation (ReLU):
# Fungsi aktivasi yang mengatur nilai negatif menjadi nol untuk meningkatkan non-linearitas model.

# Pooling (Max Pooling):
# Mereduksi dimensi spasial sambil mempertahankan fitur penting dengan mengambil nilai maksimum dari region tertentu.

# b. Layer Khusus pada ResNet50
# Residual Block:
# Komponen utama ResNet yang memungkinkan "skip connections" untuk menghindari masalah vanishing gradient.
# Setiap blok memiliki dua atau tiga lapisan konvolusi dengan ukuran kernel 3x3 atau 1x1.

# Global Average Pooling (GAP):
# Mengurangi dimensi output menjadi satu nilai rata-rata untuk setiap channel fitur.

# Fully Connected Layer:
# Menghubungkan hasil dari GAP ke kelas output dengan menggunakan operasi dot product.

# Softmax Layer (tidak diimplementasikan dalam kode di atas, biasanya digunakan untuk tugas klasifikasi):
# Menghasilkan probabilitas untuk setiap kelas target.

#========================================= Soal 3 ===============================================================#
# Jelaskan bagaimana penentuan dimensi dan nilai matrix untuk operator.
# a. Dimensi Matriks
# Convolutional Layer:
# Input: (H, W), Kernel: (K, K), Stride: S, Padding: P

# Poling Layer:
# Input: (H, W), Size: F, Stride: S

# Residual Block:
# Input: (H, W), Kernel1: (K1, K1), Kernel2: (K2, K2)

# Global Average Pooling:
# Input: (H, W) 

# b. Penentuan Nilai Matrix
# kernel = np.random.randn(7, 7)
# batch normalization: mean, variance
# skip connection: relu(input_matrix + conv2)

#========================================= Soal 4 ===============================================================#
# Jelaskan bagaimana penentuan jumlah layer yang dilewati.
# Arsitektur ResNet50
# Conv1: 1 layer

# Residual Blocks:
# Conv2_x: 6 layers
# Conv3_x: 8 layers
# Conv4_x: 12 layers
# Conv5_x: 6 layers

# Penentuan jumlah lapisan
# 1 + 6 + 8 + 12 + 6 = 33 layers