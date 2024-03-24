import random

class Character:
    def __init__(self, name, hp, atk, defense):
        self.name = name
        self.max_hp = hp
        self.hp = hp
        self.base_atk = atk
        self.base_defense = defense
        self.atk = atk
        self.defense = defense

    def attack(self, target):
        damage = max(0, self.atk - target.defense)
        target.take_damage(damage)
        print(f"{self.name} menyerang {target.name} dan menghasilkan {damage} damage!")

    def take_damage(self, damage):
        self.hp -= damage
        if self.hp <= 0:
            print(f"{self.name} telah mati!")
        else:
            print(f"{self.name} menerima {damage} damage, sisa HP: {self.hp}/{self.max_hp}")

    def is_alive(self):
        return self.hp > 0

    def reset_stats(self):
        self.atk = self.base_atk
        self.defense = self.base_defense

class Hunter(Character):
    def __init__(self, name, hp, atk, defense):
        super().__init__(name, hp, atk, defense)

    def attack(self, target, mode):
        if mode == "attack":
            self.atk += 3
            self.defense -= 2
            print(f"{self.name} memilih untuk menyerang!")
        elif mode == "defend":
            self.atk -= 2
            self.defense += 3
            print(f"{self.name} memilih untuk bertahan!")
        super().attack(target)

class Monster(Character):
    def __init__(self, name, hp, atk, defense):
        super().__init__(name, hp, atk, defense)

class MiniBoss(Character):
    def __init__(self, name, hp, atk, defense):
        super().__init__(name, hp, atk, defense)

class Boss(Character):
    def __init__(self, name, hp, atk, defense):
        super().__init__(name, hp, atk, defense)

class Game:
    def __init__(self):
        self.player_name = input("Masukkan nama karakter Anda: ")
        self.hunter = Hunter(self.player_name, hp=50, atk=10, defense=5)
        self.stage = 1
        self.monsters_per_stage = 3
        self.monster_strength_increase = 0.02

    def generate_monster(self):
        monster_types = {
            "normal": ["Goblin", "Lizardman", "Zombie", "Half-Demon", "Evil-Peri"],
            "mini_boss": ["Minotaurus", "Black-Dragon", "Giant-Demon","Bracken"],
            "boss": ["Demon-Lord", "Highest-Evil-Peri", "God-of-Dragon"]
        }
        if self.stage % 5 == 0:
            return random.choice(monster_types["boss"])
        elif (self.stage + 1) % 5 == 0:
            return random.choice(monster_types["mini_boss"] + monster_types["normal"])
        else:
            return random.choice(monster_types["normal"])

    def apply_buff(self):
        buffs = ["Tambah ATK", "Tambah DEF", "Tambah HP", "Jebakan"]
        buff = random.choice(buffs)
        print("Buff yang diperoleh:", buff)
        if buff == "Tambah ATK":
            self.hunter.atk += 5
        elif buff == "Tambah DEF":
            self.hunter.defense += 5
        elif buff == "Tambah HP":
            self.hunter.max_hp += 10
            self.hunter.hp += 10
        elif buff == "Jebakan":
            trap_damage = int(self.hunter.hp * 0.1)
            print(f"Kamu terkena jebakan! Menderita {trap_damage} damage!")
            self.hunter.take_damage(trap_damage)

    def main(self):
        while self.hunter.is_alive():
            print(f"\nStage {self.stage}")
            monsters = [self.generate_monster() for _ in range(self.monsters_per_stage)]
            for monster in monsters:
                if isinstance(monster, str):
                    monster = Monster(monster, hp=random.randint(10, 20) + int(self.stage * self.monster_strength_increase * 15),
                                      atk=random.randint(3, 7) + int(self.stage * self.monster_strength_increase * 5),
                                      defense=random.randint(1, 3) + int(self.stage * self.monster_strength_increase * 2))
                while monster.is_alive() and self.hunter.is_alive():
                    print(f"\nNama Karakter: {self.hunter.name}, HP: {self.hunter.hp}/{self.hunter.max_hp}, ATK: {self.hunter.atk}, DEF: {self.hunter.defense}")
                    print(f"Nama Musuh: {monster.name}, HP: {monster.hp}/{monster.max_hp}, ATK: {monster.atk}, DEF: {monster.defense}")
                    print("Pilihan Anda:")
                    print("1. Serang")
                    print("2. Bertahan")
                    choice = input("Masukkan pilihan Anda (1/2): ")
                    if choice == "1":
                        self.hunter.attack(monster, mode="attack")
                    elif choice == "2":
                        self.hunter.attack(monster, mode="defend")
                    else:
                        print("Pilihan tidak valid. Silakan pilih 1 atau 2.")
                        continue
                    if monster.is_alive():
                        monster.attack(self.hunter)
                        if not self.hunter.is_alive():
                            break
                if not self.hunter.is_alive():
                    break
            if self.hunter.is_alive():
                print("Selamat! Kamu telah menyelesaikan stage ini!")
                self.apply_buff()
                print(f"\nHP: {self.hunter.hp}/{self.hunter.max_hp}, ATK: {self.hunter.atk}, DEF: {self.hunter.defense}")
                choice = input("Lanjutkan ke stage berikutnya? (ya/tidak): ")
                if choice.lower() != "ya":
                    break
                self.hunter.reset_stats()
                self.stage += 1
        print("\nGame over! Kamu mati.")

if __name__ == "__main__":
    game = Game()
    game.main()