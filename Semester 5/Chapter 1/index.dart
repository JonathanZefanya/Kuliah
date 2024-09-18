/*
Nama: Jonathan Natannael Zefanya

Buatlah sebuah contoh untuk masing-masing konversi berikut 
dan tampilkan tipe datanya menggunakan runtimeType !

1. String -> int
2. String -> double
3. int -> String
4. double -> String
5. boolean -> String
6. String -> boolean

*/

void main() {
  // 1. String -> int
  String str_ke_int = "16";
  int Hasil_Int_dari_str = int.parse(str_ke_int);
  print("1. String -> int: $Hasil_Int_dari_str \ntipe data: ${Hasil_Int_dari_str.runtimeType}\n");

  // 2. String -> double
  String str_ke_Double = "16.5";
  double Hasil_Double_dari_str = double.parse(str_ke_Double);
  print("2. String -> double: $Hasil_Double_dari_str \ntipe data: ${Hasil_Double_dari_str.runtimeType}\n");

  // 3. int -> String
  int Int_ke_str = 16;
  String Hasil_str_dari_int = Int_ke_str.toString();
  print("3. int -> String: $Hasil_str_dari_int \ntipe data: ${Hasil_str_dari_int.runtimeType}\n");

  // 4. double -> String
  double Double_ke_str = 16.5;
  String Hasil_str_dari_Double = Double_ke_str.toString();
  print("4. double -> String: $Hasil_str_dari_Double \ntipe data: ${Hasil_str_dari_Double.runtimeType}\n");

  // 5. boolean -> String
  bool bool_ke_Str = true;
  String Hasil_str_dari_bool = bool_ke_Str.toString();
  print("5. boolean -> String: $Hasil_str_dari_bool \ntipe data: ${Hasil_str_dari_bool.runtimeType}\n");

  // 6. String -> boolean
  String str_ke_bool = "true";
  bool Hasil_bool_dari_str = str_ke_bool.toLowerCase() == 'true';
  print("6. String -> boolean: $Hasil_bool_dari_str \ntipe data: ${Hasil_bool_dari_str.runtimeType}\n");
}