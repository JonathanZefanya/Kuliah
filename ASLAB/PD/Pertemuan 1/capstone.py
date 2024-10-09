# Random 12 orang dengan item namanya dan dibagi menjadi 4 kelompok

import random

nama = ["Samuel", "Daffha", "Jay", "Juan", "Andi", "Arif", "Putri", "Helena", "Azril", "David", "Ovada", "Apip"]
random.shuffle(nama)
kelompok = [nama[i:i+3] for i in range(0, len(nama), 3)]

print(kelompok)