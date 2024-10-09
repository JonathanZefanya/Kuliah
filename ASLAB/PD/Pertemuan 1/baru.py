# print("Hello World")
# print("Hello", "World")
# print("Hello"+"World")

# print("Operasi Matematika")
# print(2+4)
# print(5-6)
# print(34*20)
# print(12/6)
# print(12//6)
# print(2**3)
# print(10%3)

# Tipe Data
# print(type(1))
# print(type(1.0))
# print(type("Hello"))
# print(type(True))

# print("Operasi Campuran")
# print(2.0 + 3)
# print ("2" + 5)

# print("Variabel")
# x = "Hello"
# y = "Andi"
# z = x + " " + y
# print(z)

# print("fungsi bawaan python")
# print(len("Hello"))
# print("Hello".upper())
# print("Hello".lower())

# print("Skrip")
# nama = input("Masukkan nama: ")
# umur = int(input("Masukkan umur: "))
# print("Hello", nama,"umur", umur )
# print(f"Hello nama saya {nama} dan umur {umur}")
# print("Hello nama saya {} dan umur {}".format(nama, umur))

# print("Library atau modul (pustaka)")
# import math as m

# print('menghitung akar kuadrat dari 23')
# print(m.sqrt(23))
# print('lingkaran')
# print(m.pi * 7**2)

# print("Membuat Fungsi")
# def cetak(a,b):
#     print(f"Hello {a} umur saya {b}")

# nama = input("Masukkan nama: ")
# umur = int(input("Masukkan umur: "))
# cetak(nama,umur)

# print("Operator Logika (True or False)")
# print(1 == 1)
# print(1 != 1)
# print(1 > 1)
# print(1 < 1)
# print(1 >= 1)
# print(1 <= 1)
# print(1 == 1 and 1 != 1)
# print(1 == 1 or 1 != 1)
# print(not 1 == 1)
# print(not 1 != 1)

# print("Kondisional")

# x = input("Masukkan nama: ")
# if x == "David".lower().upper():
#     print("Ini Adalah David")
# elif x == "Samuel".lower().upper():
#     print("Ini adalah Samuel")
# else:
#     print('Di larang masuk')

print("Perulangan")
# for i in range(1, 11):
#     print("Data ke-", i)
    
# for i in range(1, 11, 2):
#     print("Data ke-", i)

while True:
    print("""
          1. Pilihan 1
          2. Pilihan 2
          3. Exit
          """)
    pilihan = input("Masukan pilihan (1/2/3): ")
    if pilihan == "1":
        print("Anda memilih 1")
    elif pilihan == "2":
        print("Anda memilih 2")
    elif pilihan =="3":
        print("Exit")
        break
    else:
        print("Pilihan tidak ada")
        continue