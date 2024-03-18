# class PBO:
#     pass

# IF_A = PBO() #Object
# print(IF_A)

# class / blueprint / template
class PBO:
    # constructor
    def __init__(self, umur):
        self.namaSaya = "Jonathan"
        self.umurSaya = umur
        self.maxUmur = 1000
    
    # method
    def cetakNamaUmur(self):
        return f"nama saya: {self.namaSaya}, umur saya: {self.umurSaya}"
    
    def hitungUmur(self):
        return f"nama saya: {self.namaSaya}, sisa umur saya: {self.maxUmur - self.umurSaya}"

test = PBO(100) # object
# test2 = PBO("Guntur", 200) #object
# print(test.cetakNamaUmur())
# print(test.umurSaya)
# print(test2.cetakNamaUmur())
print(test.hitungUmur())

# objectOrang = []
# pilihan = int(input("Masukan Berapa Object: "))
# for i in range(pilihan):
#     InputNama = input("Masukan Nama Saya: ")
#     InputUmur = int(input("Masukan Umur Saya: "))
#     InputMaxUmur = 100
#     object = PBO(InputNama, InputUmur)
#     objectOrang.append(object)
    
# for object in objectOrang:
#     print("Nama",object.namaSaya, "Umur ", object.umurSaya)