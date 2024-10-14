# Pengulangan Rekursif dan Iteratif

# Rekursif
# def rekursif(n):
#     if n == 0:
#         return 0
#     else:
#         return n + rekursif(n-1)
    
# Iteratif
# def iteratif(n):
#     total = 0
#     for i in range(n+1):
#         total += i
#     return total

# n = 10
# print("Hasil Rekursif: ", rekursif(n))
# print("Hasil Iteratif: ", iteratif(n))

# Pengulangan Sekuensial
# def cari(kata, huruf):
#     for index in range(len(kata)):
#         if kata[index] == huruf:
#             return index
#     return -1

# kata = input('Masukkan kata: ')
# huruf = input('Masukkan huruf yang dicari: ')

# index = cari(kata, huruf)
# if index == -1:
#     print(huruf, 'tidak ditemukan pada', kata)
# else:
#     print(huruf, 'ada pada index', index)

# List
            # 0        1         2           3
# hewan = ['kucing', 'anjing', 'kelinci', 'hamster']
# print(hewan)
# print(hewan[0])
# print(hewan[1])
# print(hewan.append('ayam'))
# hewan[0] = 'kuda'
# print(hewan)
# hewan.clear()
# print(hewan)

# def cetakList(hewan):
#     for i in range(len(hewan)):
#         print(hewan[i])
        
# cetakList(hewan)

# Memanipulasi List
# import os

# def tambahHewan(hewan, tambahan):
#     hewan.append(tambahan)
#     return hewan

# def hapusHewan(hewan, hapus):
#     hewan.remove(hapus)
#     return hewan

# def gantiHewan(hewan, ganti, index):
#     hewan[index] = ganti
#     return hewan

# def cariHewan(hewan, cari):
#     for index in range(len(hewan)):
#         if hewan[index] == cari:
#             return index
#     return -1

# def cekHewan(hewan, cari):
#     if cari in hewan:
#         print(cari, 'ada dalam list')
#     else:
#         print(cari, 'tidak ada dalam list')

# def cetakList(hewan):
#     if len(hewan) == 0:
#         print('List kosong')
#     else:
#         for i in range(len(hewan)):
#             print(hewan[i])

# def clearScreen():
#     os.system('cls')

# selesai = False
# hewan = []

# while not selesai:
#     clearScreen()
#     print('1. Tambah Hewan')
#     print('2. Hapus Hewan')
#     print('3. Ganti Hewan')
#     print('4. Cari Hewan')
#     print('5. Cek Hewan')
#     print('6. Cetak List')
#     print('7. Selesai')
    
#     pilihan = int(input('Masukkan pilihan: '))
    
#     if pilihan == 1:
#         tambahan = input('Masukkan hewan yang ditambahkan: ')
#         hewan = tambahHewan(hewan, tambahan)
#     elif pilihan == 2:
#         hapus = input('Masukkan hewan yang dihapus: ')
#         hewan = hapusHewan(hewan, hapus)
#     elif pilihan == 3:
#         ganti = input('Masukkan hewan yang diganti: ')
#         index = int(input('Masukkan index hewan yang diganti: '))
#         hewan = gantiHewan(hewan, ganti, index)
#     elif pilihan == 4:
#         cari = input('Masukkan hewan yang dicari: ')
#         index = cariHewan(hewan, cari)
#         if index == -1:
#             print(cari, 'tidak ditemukan')
#         else:
#             print(cari, 'ada pada index', index)
#     elif pilihan == 5:
#         cari = input('Masukkan hewan yang dicari: ')
#         cekHewan(hewan, cari)
#     elif pilihan == 6:
#         cetakList(hewan)
#     elif pilihan == 7:
#         selesai = True
#     else:
#         print('Pilihan tidak valid')
    
#     input('Tekan Enter untuk melanjutkan...')

# Tuple
# hewan = ('kucing', 'anjing', 'kelinci', 'hamster')
# print(hewan)
# print(hewan[0])
# print(hewan[1])


# set
# hewan = {'kucing', 'anjing', 'kelinci', 'hamster'}
# print(hewan)
# hewan.add('ayam')
# print(hewan)
# hewan.remove('kucing')
# print(hewan)

# dictionary
# data = {'nama': 'Andi', 'umur': 21, 'pekerjaan': 'guru'}
# print(data)
# print(data['nama'])
# print(data['umur'])
# print(data['pekerjaan'])

# data['umur'] = 22
# print(data)

# print(data.keys())
# print(data.values())

# data['alamat'] = 'Jakarta'
# print(data)

# del data['pekerjaan']
# print(data)

# data.clear()
# print(data)

# Capstone Project
# Buat program untuk mengelola data mahasiswa, dengan ketentuan:
# - Data mahasiswa berupa dictionary
# - Data mahasiswa berisi NIM, Nama, dan Jurusan (IF, PWK, TI, EL, MN)
# - Program memiliki menu untuk:
#     1. Tambah data mahasiswa
#     2. Hapus data mahasiswa
#     3. Cari data mahasiswa berdasarkan NIM
#     4. Cari data mahasiswa berdasarkan Nama
#     5. Cari data mahasiswa berdasarkan Jurusan
#     6. Cetak data seluruh mahasiswa
#     7. Selesai

# Jawaban
# import os

# def tambahData(data, nim, nama, jurusan):
#     data[nim] = {'nama': nama, 'jurusan': jurusan}
#     return data

# def hapusData(data, nim):
#     del data[nim]
#     return data

# def cariDataNIM(data, nim):
#     if nim in data:
#         print('NIM:', nim)
#         print('Nama:', data[nim]['nama'])
#         print('Jurusan:', data[nim]['jurusan'])
#     else:
#         print('Data tidak ditemukan')
        
# def cariDataNama(data, nama):
#     for nim in data:
#         if data[nim]['nama'] == nama:
#             print('NIM:', nim)
#             print('Nama:', data[nim]['nama'])
#             print('Jurusan:', data[nim]['jurusan'])
#             break
#     else:
#         print('Data tidak ditemukan')
        
# def cariDataJurusan(data, jurusan):
#     for nim in data:
#         if data[nim]['jurusan'] == jurusan:
#             print('NIM:', nim)
#             print('Nama:', data[nim]['nama'])
#             print('Jurusan:', data[nim]['jurusan'])
#     else:
#         print('Data tidak ditemukan')
        
# def cetakData(data):
#     if len(data) == 0:
#         print('Data kosong')
#     else:
#         for nim in data:
#             print('NIM:', nim)
#             print('Nama:', data[nim]['nama'])
#             print('Jurusan:', data[nim]['jurusan'])
#             print()
            
# def clearScreen():
#     os.system('cls')
    
# selesai = False
# data = {}

# while not selesai:
#     clearScreen()
#     print('1. Tambah Data Mahasiswa')
#     print('2. Hapus Data Mahasiswa')
#     print('3. Cari Data Mahasiswa berdasarkan NIM')
#     print('4. Cari Data Mahasiswa berdasarkan Nama')
#     print('5. Cari Data Mahasiswa berdasarkan Jurusan')
#     print('6. Cetak Data Mahasiswa')
#     print('7. Selesai')
    
#     pilihan = int(input('Masukkan pilihan: '))
    
#     if pilihan == 1:
#         nim = input('Masukkan NIM: ')
#         nama = input('Masukkan Nama: ')
#         jurusan = input('Masukkan Jurusan: ')
#         data = tambahData(data, nim, nama, jurusan)
#     elif pilihan == 2:
#         nim = input('Masukkan NIM yang dihapus: ')
#         data = hapusData(data, nim)
#     elif pilihan == 3:
#         nim = input('Masukkan NIM yang dicari: ')
#         cariDataNIM(data, nim)
#     elif pilihan == 4:
#         nama = input('Masukkan Nama yang dicari: ')
#         cariDataNama(data, nama)
#     elif pilihan == 5:
#         jurusan = input('Masukkan Jurusan yang dicari: ')
#         cariDataJurusan(data, jurusan)
#     elif pilihan == 6:
#         cetakData(data)
#     elif pilihan == 7:
#         selesai = True
#     else:
#         print('Pilihan tidak valid')
        
#     input('Tekan Enter untuk melanjutkan...')