from abc import ABC, abstractmethod


class Smartphone(ABC):
    def __init__(self, brand, model, os, color, battery_capacity):
        self.brand = brand
        self.model = model
        self.os = os
        self.color = color
        self.battery_capacity = battery_capacity

    @abstractmethod
    def make_call(self, number):
        pass

    @abstractmethod
    def send_message(self, number, message):
        pass

    def show_info(self):
        return f"Brand: {self.brand}, Model: {self.model}, OS: {self.os}, Color: {self.color}, Battery:{self.battery_capacity}"