# Praktikum ke-3 Pemrograman Berorientasi Objek
# Studi Kasus : Adu Kekuatan Karakter Anime Naruto

import random

class Anime:
    def __init__(self, name, power):
        self.name = name
        self.__power = power

    def _attack(self, target):
        damage = max(0, self.__power - target._Anime__power)
        target._take_damage(damage)
        print(f"{self.name} menyerang {target.name} dan menghasilkan {damage} damage!")

    def _take_damage(self, damage):
        self.__power -= damage
        if self.__power <= 0:
            print(f"{self.name} telah mati!")
        else:
            print(f"{self.name} menerima {damage} damage, sisa Power: {self.__power}")

    def is_alive(self):
        return self.__power > 0

class Naruto(Anime):
    def __init__(self, name, power):
        super().__init__(name, power)

    def attack(self, target, mode):
        if mode == "attack":
            self._Anime__power += 3
            print(f"{self.name} memilih untuk menyerang!")
        elif mode == "defend":
            self._Anime__power -= 2
            print(f"{self.name} memilih untuk bertahan!")
        super()._attack(target)

class Villain(Anime):
    def __init__(self, name, power):
        super().__init__(name, power)

class StartAduKekuatan:
    def __init__(self):
        self.kenaikan_status_villain = 0.05

    def generateVillain(self, stage):
        villainType = {
            "Genin": ["Zabuza", "Haku", "Kabuto"],
            "Chunin": ["Orochimaru", "Sasuke", "Neji"],
            "Jonin": ["Itachi", "Kakashi", "Pain"],
            "Hokage": ["Madara", "Obito", "Kaguya"]
        }
        if stage == 1:
            return Villain(random.choice(villainType["Genin"]), power=50)
        elif stage == 2:
            return Villain(random.choice(villainType["Chunin"]), power=70)
        elif stage == 3:
            return Villain(random.choice(villainType["Jonin"]), power=90)
        elif stage == 4:
            return Villain(random.choice(villainType["Hokage"]), power=120)

    def battle(self):
        mc = input("Masukkan nama karakter utama: ")
        maincharacter = Naruto(mc, power=100)
        stage = 1
        
        while True:
            print(f"\nStage {stage}")
            villain = self.generateVillain(stage)
            print(f"Villain Stage {stage}: {villain.name} muncul!")
            
            while maincharacter.is_alive() and villain.is_alive():
                mode = input("Pilih mode (attack/defend): ")
                maincharacter.attack(villain, mode)
                if villain.is_alive():
                    villain._attack(maincharacter)
            
            if maincharacter.is_alive():
                print(f"Selamat, {mc} berhasil mengalahkan {villain.name}!")
                stage += 1
            else:
                print(f"{mc} telah mati!")
                print("Game Over!")
                break
            
            choice = input("Apakah Anda ingin melanjutkan (y/n)? ").lower()
            if choice != 'y':
                print("Terima kasih telah bermain!")
                break

if __name__ == "__main__":
    game = StartAduKekuatan()
    game.battle()