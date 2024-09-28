class Kakek {
  String? nama = null;
  String? pekerjaan = null;
  int? umur = null;
  Kakek(this.nama, this.pekerjaan, this.umur);
  void printData() {
    print('Nama: $nama');
    print('Pekerjaan: $pekerjaan');
    print('Umur: $umur tahun');
  }
}

class Ayah extends Kakek {
  String? namaIstri = null;
  Ayah(String nama, String pekerjaan, int umur, this.namaIstri) : super(nama, pekerjaan, umur);
  void printData() {
    super.printData();
    print('Nama Istri: $namaIstri');
  }
}

class Anak extends Ayah {
  String? namaAnak = null;
  Anak(String nama, String pekerjaan, int umur, String namaIstri, this.namaAnak) : super(nama, pekerjaan, umur, namaIstri);
  void printData() {
    super.printData();
    print('Nama Anak: $namaAnak');
  }
}

void main() {
  Anak anak = Anak('Jonathan', 'Backend Developer', 18, '', 'Zefanya');
  anak.printData();
}