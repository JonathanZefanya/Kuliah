# Polimerfisme

# 4.1 Overiding
class Uang:
    def __init__(self, nominal, logo):
        self.nominal = nominal
        self.logo = logo
        
    def cetak(self):
        print("Uang ini bernilai", self.nominal, "dan bergambar", self.logo)
        
class Rupiah(Uang):
    def __init__(self, bahan, logo, nominal):
        super().__init__(bahan, logo, nominal)
        self.bahan = bahan
        
    def cetak(self):
        print("Uang ini bernilai", self.nominal, "dan bergambar", self.logo, "serta terbuat dari", self.bahan)

uang1 = Rupiah(1000, "Soekarno", "Kertas")
uang1.cetak()