// Nama: Jonathan Natannael Zefanya

// Soal
// Buatlah sebuah contoh kasus yang menerapkan OOP lengkap dengan atribut 
// dan methodnya (class memiliki minimal 3 atribut dan 3 method)! 

// Jawaban
// Contoh kasus yang saya buat adalah sebuah game dengan karakter-karakter
// yang memiliki elemen berbeda-beda. Setiap karakter memiliki atribut HP,
// elemen, senjata, artefak, dan jenis kelamin. Setiap karakter memiliki
// method attack, defense, healing, dan status. Terdapat 4 karakter yang
// masing-masing memiliki elemen Pyro, Hydro, Electro, dan Anemo.

class Hero {
  String name; // Atribut 1
  int hp; // Atribut 2
  String elemen; // Atribut 3
  String weapon; // Atribut 4
  String artefak; // Atribut 5
  String jenisKelamin; // Atribut 6

  // Konstruktor
  Hero(this.name, this.hp, this.elemen, this.weapon, this.artefak, this.jenisKelamin);

  // Method 1 (attack)
  void attack() {
    print('$name menggunakan serangan elemen $elemen dengan senjata $weapon');
  }

  // Method 2 (defense)
  void defense() {
    print('$name bertahan dengan kekuatan dari artefak $artefak');
  }

  // Method  3 (healing)
  void healing(int healAmount) {
    hp += healAmount;
    print('$name memulihkan HP sebesar $healAmount, HP sekarang: $hp');
  }

  // Method 4 (status)
  void status() {
    if (hp <= 0) {
      print('$name telah status');
    } else {
      print('$name masih hidup dengan HP: $hp');
    }
  }
}

// Class PyroChar sebagai contoh karakter Pyro
class PyroChar extends Hero {
  PyroChar(String name, int hp, String weapon, String artefak, String jenisKelamin)
      : super(name, hp, 'Pyro', weapon, artefak, jenisKelamin);

  @override
  void attack() {
    print('$name meluncurkan serangan api!');
  }
}

// Class HydroChar sebagai contoh karakter Hydro
class HydroChar extends Hero {
  HydroChar(String name, int hp, String weapon, String artefak, String jenisKelamin)
      : super(name, hp, 'Hydro', weapon, artefak, jenisKelamin);

  @override
  void attack() {
    print('$name menyerang dengan gelombang air!');
  }
}

// Class ElectroChar sebagai contoh karakter Electro
class ElectroChar extends Hero {
  ElectroChar(String name, int hp, String weapon, String artefak, String jenisKelamin)
      : super(name, hp, 'Electro', weapon, artefak, jenisKelamin);

  @override
  void attack() {
    print('$name menghantam musuh dengan petir!');
  }
}

// Class AnemoChar sebagai contoh karakter Anemo
class AnemoChar extends Hero {
  AnemoChar(String name, int hp, String weapon, String artefak, String jenisKelamin)
      : super(name, hp, 'Anemo', weapon, artefak, jenisKelamin);

  @override
  void attack() {
    print('$name melancarkan badai angin!');
  }
}

void main() {
  // Membuat objek
  PyroChar mavuika = PyroChar('Mavuika', 1000, 'Claymore', 'Crimson Witch of Flames', 'Laki-laki');
  HydroChar kokomi = HydroChar('Kokomi', 1200, 'Catalyst', 'Heart of Depth', 'Perempuan');
  ElectroChar raiden = ElectroChar('Raiden Shogun', 1100, 'Polearm', 'Emblem of Severed Fate', 'Perempuan');
  AnemoChar venti = AnemoChar('Venti', 900, 'Bow', 'Viridescent Venerer', 'Laki-laki');

  // Running method
  mavuika.attack();
  kokomi.defense();
  raiden.healing(200);
  venti.status();
}