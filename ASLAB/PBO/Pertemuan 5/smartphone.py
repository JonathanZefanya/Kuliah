from abc import ABC, abstractmethod

class Smartphone(ABC):
    def __init__(self, merk, model, os, warna, baterai):
        self.merk = merk
        self.model = model
        self.os = os
        self.warna = warna
        self.baterai = baterai
        
    @abstractmethod
    def telepon(self, number):
        pass
    
    @abstractmethod
    def message(self, number, message):
        pass
    
    def infokan(self):
        return (f"brand: {self.merk}, \n" 
        f"model: {self.model},\n" 
        f"Sistem operasi: {self.os},\n" 
        f"Warna: {self.warna}, \n"
        f"Baterai: {self.baterai} mAh \n")
        
        