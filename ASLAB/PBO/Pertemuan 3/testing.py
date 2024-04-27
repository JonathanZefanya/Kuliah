# 3 Enkasulapsi

# 3.1 Akses Modifeier
# 3.1.1 Public
# class Hero:
#     def __init__(self, name, health,power):
#         self.name = name
#         self.health = health
#         self.power = power
        
# class Status_Hero(Hero):
#     def __init__(self, name):
#         super().__init__(name,100,100)
        
# nana = Status_Hero('Nana')
# print(f"""
#       Nama Hero: {nana.name}
#       HP hero: {nana.health}
#       Power hero: {nana.power}
#       """)

# 3.1.2 Protected
# class Hero:
#     def __init__(self, name, health,power):
#         self.name = name
#         self._health = health
#         self._power = power
        
# class Status_Hero(Hero):
#     def __init__(self, name):
#         super().__init__(name,100,100)
        
# nana = Status_Hero('Nana')
# print(f"""
#       Nama Hero: {nana.name}
#       HP hero: {nana._health}
#       Power hero: {nana._power}
#       """)

# 3.1.3 Private
# class Hero:
#     def __init__(self, name, health,power):
#         self.name = name
#         self.__health = health
#         self.__power = power
#     def __show(self):
#         print(f"Nama hero: {self.name} memiliki power sebesar {self.__power}")
        
# class Status_Hero(Hero):
#     def __init__(self, name):
#         super().__init__(name,100,100)
        
# nana = Status_Hero('Nana')
# print(nana._Hero__show())

# 3.2 Setter dan Getter
# class IF:
#     def __init__(self, nama, nim):
#         self.nama = nama
#         self.__nim = nim
#     def pindahKelas(self, nimBaru):
#         self.__nim = nimBaru # Setter
#     def getNim(self):# Getter
#         return self.__nim
#     def show(self):
#         print(f"Nama: {self.nama} dan NIM: {self.__nim}")

# class IFA(IF):
#     def __init__(self, nama, nim):
#         super().__init__(nama, nim)

# class IFB(IF):
#     def __init__(self, nama, nim):
#         super().__init__(nama, nim)

# Mahasiswa1 = IFB("Guntur", 1152700016)
# Mahasiswa1.show()
# Mahasiswa2 = IFA("Tora", 1152700015)
# Mahasiswa2.show()

# 3.3 Static Method dan Class Method
# class IF:
#     __jumlahMahasiswaIF = 0
#     def __init__(self, nama):
#         self.nama = nama
#         IF.__jumlahMahasiswaIF += 1
#     @classmethod
#     def showJumlahKelas(cls):
#         print(f"Jumlah Mahasiswa {cls.__name__}: {cls.jumlah}")
#     @staticmethod
#     def showJumlahMahasiswa():
#         print(f"Jumlah Mahasiswa IF: {IF.__jumlahMahasiswaIF}")

# class IFA(IF):
#     def __init__(self, nama):
#         super().__init__(nama)
# class IFB(IF):
#     jumlah = 0
#     def __init__(self, nama):
#         super().__init__(nama)
#         IFB.jumlah += 1

# Mahasiswa1 = IFA("Ahmad")
# Mahasiswa2 = IFA("Amay")
# Mahasiswa3 = IFB("Gado")
# Mahasiswa4 = IFB("Fahri")
# Mahasiswa5 = IFB("Yudi")

# IF.showJumlahMahasiswa()
# IFB.showJumlahKelas()

# 3.4 Property
# class IFB:
#     def __init__(self,nama,nim):
#         self.nama = nama
#         self.nim = nim
#     @property
#     def showMahasiswa(self):
#         print(f"Nama: {self.nama}\nNIM: {self.nim}")
        
# Mahasiswa = IFB("Tora", 1152700024)
# Mahasiswa.showMahasiswa
# Mahasiswa.nama
# Mahasiswa.nim

# Quick Test
class IF:
    __jumlahMahasiswaIF = 0
    def __init__(self, nama):
        self.nama = nama
        IF.__jumlahMahasiswaIF += 1
    @classmethod
    def showJumlahKelas(cls):
        print(f"Jumlah Mahasiswa {cls.__name__}: {cls.jumlah}")
    @staticmethod
    def showJumlahMahasiswa():
        print(f"Jumlah Mahasiswa IF: {IF.__jumlahMahasiswaIF}")

class IFA(IF):
    def __init__(self, nama):
        super().__init__(nama)
class IFB(IF):
    jumlah = 0
    def __init__(self, nama):
        super().__init__(nama)
        IFB.jumlah += 1
class IFC(IFB):
    jumlah = 0
    def __init__(self, nama):
        super().__init__(nama)
        IFC.jumlah += 1
        
Mahasiswa1 = IFA("Ahmad")
Mahasiswa2 = IFA("Amay")
Mahasiswa3 = IFB("Gado")
Mahasiswa4 = IFB("Fahri")
Mahasiswa5 = IFC("Yudi")
Mahasiswa6 = IFC("Yuga")

IFB.showJumlahKelas()
IFC.showJumlahKelas()

# Part 2
class IF:
    def __init__(self, nama, nim, umur):
        self.nama = nama
        self.__nim = nim
        self.__umur = umur
    def pindahKelas(self, nimBaru,umurBaru):
        self.__nim = nimBaru # Setter
    def getNim(self):# Getter
        return self.__nim, self.__umur
    def show(self):
        print(f"Nama: {self.nama} dan NIM: {self.__nim}")
        print(f"Umur: {self.__umur} Tahun")

class IFB(IF):
    def __init__(self, nama, nim, umur):
        super().__init__(nama, nim, umur)

Mahasiswa1 = IFB("Guntur", 1152700016, 18)
Mahasiswa1.show()