# Praktikum ke-1 Pemrograman Berorientasi Objek

class MobileLegend:
    def __init__(self,Nama,HP,Mana,BaseAttack):
        self.nama = Nama
        self.hp = HP
        self.mana = Mana
        self.baseattack = BaseAttack
    def buff(self):
        self.total_attack = self.baseattack + 0.2 * self.hp
        return self.total_attack

heroes = []
pilihan = int(input("Masukan Banyaknya Hero: "))
for i in range(pilihan):
    nama = input("Masukan Nama Hero: ")
    hp = int(input("Masukan HP Hero: "))
    mana = int(input("Masukan mana hero: "))
    base_attack = int(input("Masukan base attack hero: ","\n"))
    hero = MobileLegend(nama,hp,mana,base_attack)
    heroes.append(hero)
    
for hero in heroes:
    print("\n",hero.nama)
    print(hero.hp)
    print(hero.mana)
    print(hero.baseattack,"\n")

# Tugas
# Membuat program menggunakan class dan object dengan ketentuan:
# 1. Class Belanja
# 2. Atribut: Nama, Harga, Jumlah
# 3. Fungsi: Total Harga
# 4. Object: Bebas
# 5. Mencetak Atribut dan Fungsi
# Catatan: Input user dan mencetak bisa lebih dari 1 object 
# tanpa membuat object baru    