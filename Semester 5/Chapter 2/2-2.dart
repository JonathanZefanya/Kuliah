// Nama: Jonathan Natannael Zefanya
// Soal:
/*
  Buat sebuah program yang mengimplementasikan control flow dan collections. 
  Program yang akan dibuat harus memenuhi ketentuan seperti berikut:
  1. Mengeluarkan output berupa 
    "LULUS" dengan syarat nilai ≥ 80, 
    "REVISI" dengan syarat 50 ≤ nilai < 80, dan 
    "TIDAK LULUS" dengan syarat nilai < 50.
  2. Menggunakan map untuk menyimpan data nama siswa dan nilainya. Jumlah siswa minimal 5 orang.

  Output yang diharapkan:
  udin: LULUS
  budi: REVISI
  nina: REVISI
  desi: LULUS
  dimas: TIDAK LULUS
  
*/

// Jawaban:
void main() {
  // Membuat map untuk menyimpan nama siswa dan nilai
  Map<String, int> siswa = {
    'udin': 82,
    'budi': 65,
    'nina': 78,
    'desi': 92,
    'dimas': 34,
  };

  // Mengiterasi map dengan forEach
  siswa.forEach((nama, nilai) {
    if (nilai >= 80) {
      print('$nama: LULUS');
    } else if (nilai >= 50 && nilai < 80) {
      print('$nama: REVISI');
    } else {
      print('$nama: TIDAK LULUS');
    }
  });
}