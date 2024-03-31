# Enkasulapsi

# 3.1 Akses Modifier
# Akses Modifier adalah metode yang digunakan untuk mengatur hak akses dari sebuah atribut atau method pada sebuah class
# Perbedaan Public, Protected, dan Private
# Public = Dapat diakses dari mana saja
# Protected = Dapat diakses dari class turunan
# Private = Hanya dapat diakses dari class itu sendiri

# 3.1.1 Public
class Hero:
    def __init__(self, name, health, power):
        self.name = name
        self.health = health
        self.power = power
        
class Hero_intelligent(Hero):
    def __init__(self, name):
        super().__init__(name, 100, 80)
        
lina = Hero_intelligent('lina')
print(lina.name)
print(lina.health)
print(lina.power, "\n")

# Buat contoh untuk protected dan private di file yang berbeda untuk menunjukan perbedaannya
# 3.1.2 Protected
class Hero:
    def __init__(self, name, health, power):
        self.name = name
        self._health = health
        self._power = power
        
class Hero_intelligent(Hero):
    def __init__(self, name):
        super().__init__(name, 100, 80)
        
lina = Hero_intelligent('lina')
print(lina.name) # Cara mengakses public attribute
print(lina._health) # Cara mengakses protected attribute
print(lina._power,"\n") 

# 3.1.3 Private
class Anime:
    def __init__(self, name, genre, rating):
        self.name = name
        self.__genre = genre
        self.__rating = rating
    def __show(self):
        print(f"Anime {self.name} memiliki genre {self.__genre} dengan rating {self.__rating}")
    
class Anime_shounen(Anime):
    def __init__(self, name):
        super().__init__(name, 'Shounen', 8)
        
naruto = Anime_shounen('Naruto') 
print(naruto.name) # Cara mengakses public attribute
print(naruto._Anime__show()) # Cara mengakses private method

# naruto._Anime__show() merupakan name mangling, yaitu cara untuk mengakses private method
# name mangling tidak disaranakan karena dapat merusak program
# name mangling hanya digunakan untuk debugging, bukan untuk diimplementasikan dalam program
# Untuk diimplementasikan dalam program, gunakan getter dan setter

# 3.2 Setter dan Getter
# Setter digunakan untuk mengubah nilai dari sebuah atribut
# Getter digunakan untuk mengakses nilai dari sebuah 
# Setter dan Getter digunakan untuk mengakses atribut private

class IF:
    def __init__(self, name, nim):
        self.__name = name # Private attribute
        self.__nim = nim # Private attribute
    def pindahKelas(self, nimBaru):
        self.__nim = nimBaru # Setter
    def getNim(self):
        return self.__nim # Getter
    def show(self):
        print(f"Nama: {self.__name} NIM: {self.__nim}")
        
Guntur = IF('Guntur', 1152700015)
Guntur.show()
Guntur.pindahKelas(1152700016)
Guntur.show()
print(Guntur.getNim())

# 3.3 Static Method dan Class Method
# Static Method adalah method yang dapat diakses dari class itu sendiri
# Class Method adalah method yang dapat diakses dari class turunannya

class MerekHP:
    __jumlahHP = 0
    def __init__(self, nama):
        self.nama = nama
        MerekHP.__jumlahHP += 1
    @classmethod
    def showMerekHP(cls):
        print(f"Nama HP: {cls.__name__}") # Berhasil diakses dan yang keluar adalah class turunannya
    @staticmethod
    def showJumlahHP():
        print(f"Jumlah HP: {MerekHP.__jumlahHP}") 
        
    # Gagal diakses karena static method tidak bisa mengakses atribut private
    @staticmethod
    def showMerekHandPhone():
        print(f"Nama HP: {MerekHP.__name__}") # Berhasil diakses tetapi yang keluar class MerekHP
        
class Samsung(MerekHP):
    def __init__(self, nama):
        super().__init__(nama)
        
class Xiaomi(MerekHP):
    def __init__(self, nama):
        super().__init__(nama)
        
Samsung1 = Samsung('Samsung Galaxy A51')
Samsung2 = Samsung('Samsung Galaxy A71')
Xiaomi1 = Xiaomi('Xiaomi Redmi Note 8')
Xiaomi2 = Xiaomi('Xiaomi Redmi Note 9')
MerekHP.showJumlahHP()
Samsung.showMerekHP()
Xiaomi.showMerekHP()
Samsung.showMerekHandPhone()

# 3.4 Property dan format
# Property digunakan untuk mengubah method menjadi seperti atribut
# Format digunakan untuk mengubah format dari sebuah string

class Mahasiswa:
    def __init__(self, nama, nim):
        self.nama = nama
        self.nim = nim
    @property
    def show(self):
        print(f"Nama: {self.nama} NIM: {self.nim}")
        
Guntur = Mahasiswa('Guntur', 1152700015)
Guntur.show
Guntur.nama = 'Guntur Budi'
Guntur.show