// Nama: Jonathan Natannael Zefanya
// Soal:

/*
Buatlah sebuah class Tiket yang memiliki fungsi untuk menghitung harga tiket berdasarkan jumlah penumpang, 
berat bagasi, dan kelas.
Class tersebut memiliki variabel lokal untuk menampung harga kelas sebagai berikut:
1. Jika kelasnya e maka harga kelasnya adalah 350000
2. Jika kelasnya b maka harga kelasnya adalah 500000

Class ini juga memiliki variabel lokal untuk mengatur harga bagasi dengan ketentuan nilainya sebagai berikut:
1. Harga bagasi adalah 0 jika berat bagasi ≤ 20
2. Harga bagasi adalah (berat bagasi - 20)* 100000 jika berat bagasi > 20

Class ini memiliki fungsi untuk menghitung total harga tiket dengan rumus 
total harga tiket = jumlah penumpang * harga kelas + harga bagasi
*/

// Jawaban:
class Tiket {
  int jumlahPenumpang;
  int beratBagasi;
  String kelas;
  int hargaKelas;
  int hargaBagasi;

  Tiket(this.jumlahPenumpang, this.beratBagasi, this.kelas)
      : hargaKelas = 0,
        hargaBagasi = 0 {
    if (kelas == 'e') {
      hargaKelas = 350000;
    } else if (kelas == 'b') {
      hargaKelas = 500000;
    }

    if (beratBagasi <= 20) {
      hargaBagasi = 0;
    } else {
      hargaBagasi = (beratBagasi - 20) * 100000;
    }
  }

  int totalHargaTiket() {
    return jumlahPenumpang * hargaKelas + hargaBagasi;
  }
}

void main() {
  Tiket tiket = Tiket(2, 20, 'b');
  print('Jumlah Penumpang: ${tiket.jumlahPenumpang}');
  print('Berat Bagasi: ${tiket.beratBagasi} kg');
  if (tiket.hargaBagasi == 0) {
    print('Harga Bagasi: Tidak ada biaya bagasi');
  } else {
    print('Harga Bagasi: Rp.${tiket.hargaBagasi}');
  }
  print('Harga Tiket Kelas ${tiket.kelas}: Rp.${tiket.hargaKelas}');
  print('Total harga tiket: Rp.${tiket.totalHargaTiket()}');
}