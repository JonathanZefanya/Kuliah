class A():
    def __init__(self, nama):
        self.nama = nama
        
class B():
    def __init__(self, umur):
        self.umur = umur
    def info(self, orang):
        print(f"Nama: {orang.nama} Umur: {self.umur}")


