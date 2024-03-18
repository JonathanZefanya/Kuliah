# Membuat Object
# Object adalah instance dari class
class PBO: #Template
    pass
pbo_if_a = PBO() #Object
# Mencetak Object
print(pbo_if_a ,"\n")

# Membuat Atribut
# Atribut adalah karakteristik dari object
class PBO:
    pass
pbo_if_b = PBO() #Object
pbo_if_b.nama = "PBO IF A 2023" #Atribut
print(pbo_if_b.nama, "\n")

# Membuat Atribut menggunakan metode konstruktor
class PBO:
    # Fungsi Konstruktor
    def __init__(self, namaMahasiswa, Kelas):
        self.mahasiswa = namaMahasiswa
        self.kelas = Kelas
# Membuat Object
mahasiswa1 = PBO("Faris", "PBO IF A 2023") #Object
mahasiswa2 = PBO("Fahmi", "PBO IF B 2023") #Object
# Mencetak Object
print(mahasiswa1)
# Mencetak Atribut
print(mahasiswa1.mahasiswa, "Berada di kelas", mahasiswa1.kelas, "\n")

# Membuat Fungsi pada object
class PBO:
    # Fungsi Konstruktor
    def __init__(self, namaMahasiswa, Kelas, Nilai):
        self.mahasiswa = namaMahasiswa
        self.kelas = Kelas
        self.nilai = Nilai
    # Fungsi
    def hitungNilai(self):
        return self.nilai * 2
# Membuat Object
mahasiswa1 = PBO("Faris", "PBO IF A 2023", 90) #Object
mahasiswa2 = PBO("Fahmi", "PBO IF B 2023", 80) #Object
mahasiswa3 = PBO("Fikri", 2, 70) #Object
# Mencetak Atribut
print(mahasiswa1.mahasiswa, "Berada di kelas", mahasiswa1.kelas, "Dengan Nilai", mahasiswa1.hitungNilai(), "\n")

# Membuat Fungsi pada object dengan input user
class PBO:
    # Fungsi Konstruktor
    def __init__(self, namaMahasiswa, Kelas, Nilai):
        self.mahasiswa = namaMahasiswa
        self.kelas = Kelas
        self.nilai = Nilai
    # Fungsi
    def hitungNilai(self):
        return self.nilai * 2
# Membuat Atribut
mahasiswa = input("Masukkan Nama Mahasiswa: ")
kelas = input("Masukkan Kelas: ")
nilai = int(input("Masukkan Nilai: "))
# Membuat Object
mahasiswa1 = PBO(mahasiswa, kelas, nilai)
# Mencetak Atribut
print(mahasiswa1.mahasiswa, "Berada di kelas", mahasiswa1.kelas, "Dengan Nilai", mahasiswa1.hitungNilai(), "\n")

# Membuat Fungsi pada object dengan input user dan mencetak bisa lebih dari 1 object tanpa membuat object baru
class PBO:
    # Fungsi Konstruktor
    def __init__(self, namaMahasiswa, Kelas, Nilai):
        self.mahasiswa = namaMahasiswa
        self.kelas = Kelas
        self.nilai = Nilai
    # Fungsi
    def hitungNilai(self):
        return self.nilai * 2
# Membuat Object
kumpulanMahasiswa = []
pilihan = int(input("Masukkan Jumlah Mahasiswa: "))
for i in range(pilihan):
    mahasiswa = input("Masukkan Nama Mahasiswa: ")
    kelas = input("Masukkan Kelas: ")
    nilai = int(input("Masukkan Nilai: "))
    mahasiswa = PBO(mahasiswa, kelas, nilai)
    kumpulanMahasiswa.append(mahasiswa)
# Mencetak Atribut
for mahasiswa in kumpulanMahasiswa:
    print(mahasiswa.mahasiswa, "Berada di kelas", mahasiswa.kelas, "Dengan Nilai", mahasiswa.hitungNilai(), "\n")


# Tugas
# Membuat program menggunakan class dan object dengan ketentuan:
# 1. Class Belanja
# 2. Atribut: Nama, Harga, Jumlah
# 3. Fungsi: Total Harga
# 4. Object: 3 buah
# 5. Mencetak Atribut dan Fungsi
# Catatan: Input user dan mencetak bisa lebih dari 1 object tanpa membuat object baru

class Belanja:
    # Fungsi Konstruktor
    def __init__(self, namaBarang, Harga, Jumlah):
        self.barang = namaBarang
        self.harga = Harga
        self.jumlah = Jumlah
    # Fungsi
    def totalHarga(self):
        return self.harga * self.jumlah
# Membuat Object
kumpulanBarang = []
pilihan = int(input("Masukkan Jumlah Barang: "))
for i in range(pilihan):
    barang = input("Masukkan Nama Barang: ")
    harga = int(input("Masukkan Harga: "))
    jumlah = int(input("Masukkan Jumlah: "))
    barang = Belanja(barang, harga, jumlah)
    kumpulanBarang.append(barang)
# Mencetak Atribut
for barang in kumpulanBarang:
    print(barang.barang, "Dengan Harga", barang.harga, "Dengan Jumlah", barang.jumlah, "Total Harga", barang.totalHarga(), "\n")