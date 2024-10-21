# Capstone
# Buat program yang meminta input dari user yang merupakan seorang prodi. 
# Program akan menampilkan menu berikut:
# 1. Lihat data mahasiswa
# 2. Tambah data mahasiswa
# 3. Perbarui data mahasiswa
# 4. Hapus data mahasiswa
# 5. Keluar

# Program akan menampilkan data mahasiswa yang ada di database berdasarkan prodi yang diinputkan oleh user. User dapat menambahkan data mahasiswa, 
# memperbarui data mahasiswa, dan menghapus data mahasiswa. Program akan terus berjalan hingga user memilih menu keluar.

# Jawaban
import sqlite3
import os

def create_table():
    conn = sqlite3.connect('mahasiswa.db')
    cursor = conn.cursor()
    
    query = '''
    CREATE TABLE IF NOT EXISTS mahasiswa (
        nim TEXT PRIMARY KEY,
        nama TEXT,
        jurusan TEXT
    )
    '''
    cursor.execute(query)
    conn.commit()
    conn.close()
    
def insert_data():
    conn = sqlite3.connect('mahasiswa.db')
    cursor = conn.cursor()
    
    nim = input('NIM: ')
    query = f"SELECT * FROM mahasiswa WHERE nim = '{nim}'"
    cursor.execute(query)
    if cursor.fetchone() is not None:
        print('NIM sudah terdaftar')
        return
    
    nama = input('Nama: ')
    jurusan = input('Jurusan: ')
    if jurusan not in ['IF']:
        print('Jurusan tidak valid')
        return
    
    query = f"INSERT INTO mahasiswa VALUES ('{nim}', '{nama}', '{jurusan}')"
    cursor.execute(query)
    conn.commit()
    conn.close()
    
def read_data():
    conn = sqlite3.connect('mahasiswa.db')
    cursor = conn.cursor()
    
    query = "SELECT * FROM mahasiswa"
    cursor.execute(query)
    if cursor.fetchone() is None:
        print('Tidak ada data')
        return
    
    for data in cursor.fetchall():
        print(data)
        
def update_data():
    conn = sqlite3.connect('mahasiswa.db')
    cursor = conn.cursor()
    
    nim = input('NIM: ')
    query = f"SELECT * FROM mahasiswa WHERE nim = '{nim}'"
    cursor.execute(query)
    if cursor.fetchone() is None:
        print('NIM tidak terdaftar')
        return
    
    nama = input('Nama: ')
    jurusan = input('Jurusan: ')
    if jurusan not in ['IF']:
        print('Jurusan tidak valid')
        return
    
    query = f"UPDATE mahasiswa SET nama = '{nama}', jurusan = '{jurusan}' WHERE nim = '{nim}'"
    cursor.execute(query)
    conn.commit()
    conn.close()
    
def delete_data():
    conn = sqlite3.connect('mahasiswa.db')
    cursor = conn.cursor()
    
    nim = input('NIM: ')
    query = f"SELECT * FROM mahasiswa WHERE nim = '{nim}'"
    cursor.execute(query)
    if cursor.fetchone() is None:
        print('NIM tidak terdaftar')
        return
    
    query = f"DELETE FROM mahasiswa WHERE nim = '{nim}'"
    cursor.execute(query)
    conn.commit()
    conn.close()
    
def main():
    create_table()
    
    while True:
        os.system('cls')
        print('Menu')
        print('1. Lihat data mahasiswa')
        print('2. Tambah data mahasiswa')
        print('3. Perbarui data mahasiswa')
        print('4. Hapus data mahasiswa')
        print('5. Keluar')
        
        menu = input('Pilih menu: ')
        if menu == '1':
            read_data()
        elif menu == '2':
            insert_data()
        elif menu == '3':
            update_data()
        elif menu == '4':
            delete_data()
        elif menu == '5':
            break
        else:
            print('Menu tidak valid')
            
        input('Tekan Enter untuk melanjutkan...')
        
if __name__ == '__main__':
    main()