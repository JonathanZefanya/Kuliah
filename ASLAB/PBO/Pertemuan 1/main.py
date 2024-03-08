# Pemrograman Berbasis Objek

# Class
class Hero:
    # Class Variable
    jumlah = 0

    def __init__(self, inputName, inputHealth, inputPower, inputArmor):
        # Instance Variable
        self.name = inputName
        self.health = inputHealth
        self.power = inputPower
        self.armor = inputArmor
        Hero.jumlah += 1
        print("Membuat Hero dengan nama " + inputName)
        
    # Void Function, Method tanpa return
    def siapa(self):
        print("Namaku adalah " + self.name)
        
    # Method dengan argumen
    def healthUp(self, up):
        self.health += up
        
    # Method dengan return
    def getHealth(self):
        return self.health
    
hero1 = Hero("Sniper", 100, 10, 4)
hero2 = Hero("Sven", 200, 5, 10)

hero1.siapa()
hero1.healthUp(10)

print(hero1.getHealth())
print(hero2.getHealth())