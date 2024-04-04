# Pewarisan PBO

# Part 1: Pewarisan Sederhana
class Ortu:
    def __init__(self, nama, umur):
        self.nama = nama
        self.umur = umur

    def info(self):
        print(f"Nama: {self.nama}\nUmur: {self.umur}\n")
        
class Anak(Ortu):
    def __init__(self, hobi):
        self.hobi = hobi

    def info(self, SelisihUmurAnak):
        # self.umur diambil dari class Ortu
        # SelisihUmurAnak diambil dari parameter info
        print(f"Nama: {self.nama}\nUmur: {self.umur - SelisihUmurAnak}\nHobi: {self.hobi}") 
               #Nama  Umur
bapak1 = Ortu("Budi", 25)
                #Hobi
anak1 = Anak("Membaca")
anak1.nama = "Wahyono"
anak1.umur = 25
bapak1.info() # Tidak ada parameter yang diambil dari fungsi info di class Ortu
anak1.info(5) # 5 merupakan parameter yang diambil dari class Anak yaitu SelisihUmurAnak

# Part 2: Pewarisan Fungsi Super
class Ortu:
    def __init__(self, nama, umur):
        self.nama = nama # Atribut
        self.umur = umur # Atribut

    def info(self):
        print(f"Nama: {self.nama}\nUmur: {self.umur}\n")
class Anak(Ortu):
    def __init__(self, nama, umur, hobi):
        # Fungsi super digunakan untuk mengambil atribut dari class induk
        super().__init__(nama, umur)
        self.hobi = hobi

    def info(self):
        super().info()
        print(f"Hobi: {self.hobi}")
              # Nama Umur
bapak2 = Ortu("Budi", 30)
              # Nama   Umur   Hobi
anak2 = Anak("Wahyono", 25, "Membaca")
anak2.info()
print(f"perbedaan umur antara {bapak2.nama} dan {anak2.nama} adalah: {bapak2.umur - anak2.umur} tahun") #bapak2.nama, anak2.nama, bapak2.umur, anak2.umur diambil dari (namaobjek.namaatribut).

# Part 3 : Pewarisan Multi Level
class Ortu:
    def __init__(self, nama, umur):
        self.nama = nama
        self.umur = umur

    def info(self):
        print(f"Nama: {self.nama}\nUmur: {self.umur}\n")
        
class Anak(Ortu):
    def __init__(self, nama, umur, hobi):
        super().__init__(nama, umur)
        self.hobi = hobi

    def info(self):
        super().info()
        print(f"Hobi: {self.hobi}")
        
class Cucu(Anak):
    def __init__(self, nama, umur, hobi, sekolah):
        super().__init__(nama, umur, hobi)
        self.sekolah = sekolah

    def info(self):
        super().info()
        print(f"Sekolah: {self.sekolah}")
               #Nama   umur
bapak3 = Ortu("Budi", 30)
                #Nama   Umur  Hobi
anak3 = Anak("Wahyono", 25, "Membaca")
               #Nama Umur    Hobi       Sekolah
cucu1 = Cucu("Wahyu", 10, "Bermain", "SDN 3 Tangsel")
cucu1.info() # Menampilkan info dari class Cucu
print(f"perbedaan umur antara {bapak3.nama} dan {cucu1.nama} adalah: {bapak3.umur - cucu1.umur} tahun") #bapak3.nama, cucu1.nama, bapak3.umur, cucu1.umur diambil dari (namaobjek.namaatribut).