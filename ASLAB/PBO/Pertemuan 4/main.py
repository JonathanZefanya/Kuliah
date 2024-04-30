# Polimorfisme

# 4.1 Overriding
class Uang:
    def __init__(self, nominal, logo):
        self.nominal = nominal
        self.logo = logo
        print(f"Uang: {self.nominal}, Logo Uang: {self.logo}")
    def info(self):
        print("Uang dengan nominal sebesar: ", self.nominal)
class Kertas(Uang):
    def __init__(self, bahan):
        super().__init__(100000, "Soekarno")
        self.bahan = bahan
    def info(self):
        print(f"Uang dengan nominal: {self.nominal}")
        print(f"Uang dengan bahan: {self.bahan}")
uang1 = Kertas("Nilon")
uang1.info()

# 4.2 Overloading
class Uang:
    def __init__(self, nominal, logo):
        self.nominal = nominal
        self.logo = logo
        print(f"Uang: {self.nominal}, Logo Uang: {self.logo}")
    def info(self):
        print("Uang dengan nominal sebesar: ", self.nominal)
class Kertas(Uang):
    def __init__(self, bahan):
        super().__init__(100000, "Soekarno")
        self.bahan = bahan
    def info(self, noSeri):
        print(f"Uang dengan nominal: {self.nominal}")
        print(f"Uang dengan bahan: {self.bahan}")
        print(f"No Seri: {noSeri}")
uang1 = Kertas("Nilon")
uang1.info(123)

# 4.3 Method Resolution Order & Diamond Problem
class Kakek:
    def __init__(self, nama):
        self.nama = nama
    def tampilkanNama(self):
        print(f"Nama Kakek saya {self.nama}")
class Ayah(Kakek):
    def __init__(self, nama):
        self.nama = nama
    def tampilkanNama(self):
        print(f"Nama Ayah saya {self.nama}")
class Ibu(Kakek):
    def __init__(self, nama):
        self.nama = nama
    def tampilkanNama(self):
        print(f"Nama Ibu saya {self.nama}")
class Anak(Ayah,Ibu):
    def __init__(self, nama):
        self.nama = nama
        
anak = Anak("Wahyono")
# help(anak)

# 4.4 Magic Method
class Uang:
    def __init__(self, nominal, logo):
        self.nominal = nominal
        self.logo = logo
        #__str__
    def __str__(self):
        return f"nominal: {self.nominal} dan logo: {self.logo}"
        # __add__
    def __add__(self, objek):
        return self.nominal + objek.nominal

uang1 = Uang(100000, "Soekarno")
uang2 = Uang(50000, "Wahyu")
print(uang1)
total = uang1 + uang2
print(total)

# Diamond Problem
class A:
    def show(self):
        print("ini kelas A")
class B(A):
    def show(self):
        print("Ini kelas B")
class C(A):
    def show(self):
        print("ini kelas C")
class D(B):
    def show(self):
        print("ini kelas D")
class E(C,D):
    pass

e = E()
# help(e)