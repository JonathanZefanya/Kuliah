# Hubungan Antar Objek

# 6.1 Asosiasi
class Penjual():
    def __init__(self, nama, barang, harga):
        self.nama = nama
        self.barang = barang
        self.harga = harga
    def jual(self,pembeli):
        # print(self.nama, "Menjual", self.barang, "Kepada", pembeli.nama, "Dengan Harga", self.harga, "seharga", self.harga)
        print(f"{self.nama} menjual {self.barang} kepada {pembeli.nama} dengan harga {self.harga}")
class Pembeli():
    def __init__(self, nama):
        self.nama = nama

def mainProgram():
    print("Hubungan Antar Penjual dan Pembeli")
    Guntur = Penjual("Guntur","Narkoboy","Rp 1.000.000")
    Guntur = Penjual("Guntur","M4A1","Rp 3.200.000")
    Ahmid = Pembeli("Ahmid")
    Fahmi = Pembeli("Fahmi")
    Guntur.jual(Fahmi)
mainProgram()

# 6.2 Agregasi
class Karyawan():
    def __init__(self, nama, umur):
        self.nama = nama
        self.umur = umur
    def info(self, honor):
        totalGaji = honor.gajiPokok + honor.lembur + honor.tunjangan
        totalGaji -= honor.pajak # totalGaji = totalGaji - honor.pajak
        if totalGaji < 0:
            print(f"{self.nama} Miskin")
        else:
            print(f"{self.nama} mendapatkan honor sebanyak Rp. {totalGaji} per bulan")
class Honor():
    def __init__(self, gajiPokok, lembur, tunjangan, pajak):
        self.gajiPokok = gajiPokok
        self.lembur = lembur
        self.tunjangan = tunjangan
        self.pajak = pajak    
def main():
    print(" Agregasi (Saling Memiliki)")
    faris = Karyawan("Faris", 24)
    guntur = Karyawan("Guntur",30)
    honor = Honor(5000000, 3000000, 20000000, 1000)
    guntur.info(honor)
main()

# 6.3 Komposisi
class Warga():
    def __init__(self,nama):
        self.nama = nama
        self.ktp = KTP(None,None)
class KTP():
    def __init__(self, NIK, nomor):
        self.NIK = NIK
        self.nomor = nomor
    def cetak(self, warga):
        print(f"Kepemilikan NIK KTP ini {self.NIK} dan {self.nomor} adalah {warga.nama}")
def main():
    rafi = Warga("Rafi")
    rafi.ktp.NIK = input("Silahkan Masukan NIK KTP: ")
    rafi.ktp.nomor = input("Masukan Nomor: ")
    faris = Warga("Faris")
    faris.ktp.NIK = input("Silahkan Masukan NIK KTP: ")
    faris.ktp.nomor = input("Masukan Nomor: ")
    if rafi.ktp.NIK != faris.ktp.NIK:
        rafi.ktp.cetak(rafi)
        faris.ktp.cetak(faris)
    else:
        print("Tidak boleh, NIK sama")
main()