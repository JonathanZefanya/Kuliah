// Nama: Jonathan Natannael Zefanya
// Soal:
/*
  Buatlah sebuah program untuk menampilkan hasil luas persegi 
  yang mana ukuran panjang dan lebar didapatkan dari inputan user.
*/

// Jawaban:
import 'dart:io';

void main() {
  print('Luas Persegi\n');
  print("Masukkan panjang: ");
  int panjang = int.parse(stdin.readLineSync()!);

  print("Masukkan lebar: ");
  int lebar = int.parse(stdin.readLineSync()!);

  int luas = panjang * lebar;
  print("Luas persegi adalah $luas");
}