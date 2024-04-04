# Enkapsulasi

# Akses Modifier
# Public
# class Hero:
#     def __init__(self, nama, hp):
#         self.nama = nama
#         self.hp = hp
# class Hero_Status(Hero):
#     def __init__(self, nama):
#         super().__init__(nama, 100)
        
# Zhilong = Hero_Status("Zhilong")
# print(Zhilong.nama, "dan", Zhilong.hp)

# Protected
# class Hero:
#     def __init__(self, nama, hp, power):
#         self._nama = nama
#         self._hp = hp
#         self._power = power
#     def _buff(self, buff):
#         print("Total Power:", self._power + buff)
# class Hero_Status(Hero):
#     def __init__(self, nama, hp, power):
#         super().__init__(nama, hp, power)
#     def _Debuff(self, debuff):
#         print("Total Power:",self._power - debuff)

# Zhilong = Hero("Zhilong", 100, 200)
# Zhilong._buff(300)
# Nana = Hero_Status("Nana", 100, 200)
# Nana._power = 200
# Nana.Debuff(100)

# Private
# class IF:
#     def __init__(self, nama, nim):
#         self.nama = nama
#         self.__nim = nim
#     def __cetak(self):
#         print(f"Nama Mahasiswa: {self.nama} dan NIM mahasiswa tsb adalah {self.__nim}")
        
# class IFA(IF):
#     def __init__(self, nama, nim):
#         super().__init__(nama, nim)

# Rafi = IFA("Rafi", 1152700015)
# print(f"Nama Saya: {Rafi.nama}")
# print(f"NIM saya: {Rafi._IF__nim}")
# print(Rafi._IF__cetak())

# Setter dan Getter
# class IF:
#     def __init__(self, nama, nim):
#         self.nama = nama
#         self.__nim = nim
#     def pindah_kelas(self,nimBaru):
#         self.__nim = nimBaru # Setter
#     def show_nim(self):
#         return self.__nim  # Getter
#     def cetak(self):
#         print(f"Nama Mahasiswa: {self.nama} dan NIM mahasiswa tsb adalah {self.__nim}")
        
# Guntur = IF("Guntur", 1152700017)
# print("Sebelum pindah Kelas: ")
# Guntur.cetak()
# print("Sesudah pindah Kelas: ")
# Guntur.pindah_kelas(1152700032)
# Guntur.cetak()

# Static Method dan Class Method
class MerekHP:
    __jumlah = 0
    def __init__(self, nama):
         self.nama = nama
         MerekHP.__jumlah += 1
    @classmethod
    def showmerekhp(cls):
        print(f"merk hp: {cls.__name__}")
    @staticmethod
    def showJumlahHP():
        print(f"Jumlah HP keseluruhan: {MerekHP.__jumlah}")
class Xiaimi(MerekHP):
    def __init__(self, nama):
        super().__init__(nama)
class Samsung(MerekHP):
    def __init__(self, nama):
        super().__init__(nama)

samsung_1 = Samsung("Samsung Galaxy A3")
Xiaomi_1 = Xiaimi("Redmi Note 10A")
MerekHP.showJumlahHP()
Samsung.showmerekhp()
Xiaimi.showmerekhp()
Samsung.showJumlahHP()

