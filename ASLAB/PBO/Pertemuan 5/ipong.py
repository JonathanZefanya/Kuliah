from smartphone import Smartphone as sp

class Ipong(sp):
    def __init__(self, model, warna, baterai):
        super().__init__("Apple", model, "IOS", warna, baterai)
        
    def telepon(self, number):
        return f"Ipong telepon {number}"
    
    def message(self, number, message):
        return f"Isi Pesan Ipong ke {number}: {message}"
    
class Ipong15(Ipong):
    def __init__(self, warna, baterai, no_seri):
        super().__init__("15", warna, baterai)
        self._no_seri = no_seri
        
    @property
    def no_seri(self):
        return self._no_seri
    
    @no_seri.setter
    def no_seri(self, nilai):
        self._no_seri = nilai
        
    @staticmethod
    def face_id():
        return "Face ID Sukses"
    
    def infokan(self):
        return (f"brand: {self.merk}, \n"
        f"model: {self.model},\n" 
        f"Sistem operasi: {self.os},\n" 
        f"Warna: {self.warna},\n"
        f"Baterai: {self.baterai}, mAh \n"
        f"Nomor Seri: {self._no_seri}\n")

class Ipong12(Ipong):
    def __init__(self, warna, baterai):
        super().__init__("12", warna, baterai)
    
    @staticmethod
    def design():
        return "Kamera Boba 4"
    
    def infokan(self):
        return (f"brand: {self.merk}, \n"
        f"model: {self.model}, \n"
        f"Sistem operasi: {self.os}, \n" 
        f"Warna: {self.warna},\n"
        f"Baterai: {self.baterai}, mAh \n"
        f"Design HP: {self.design()}, \n")
        
ipong15 = Ipong15("Black", 5000, "A234")
ipong12 = Ipong12("White", 3000)

print(ipong12.infokan())
print(ipong12.design())
print("")
print(ipong15.infokan())
print(ipong15.face_id())