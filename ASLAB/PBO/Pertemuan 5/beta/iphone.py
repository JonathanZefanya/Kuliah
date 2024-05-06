from main import Smartphone

class iPhone(Smartphone):
    def __init__(self, model, color, battery_capacity) :
        super().__init__("Apple", model, "iOS", color, battery_capacity)

    def make_call(self, number):
        return f"iPhone calling {number}"

    def send_message(self, number, message):
        return f"iPhone sending message to {number}: {message}"


class IPhone15(iPhone):
    def __init__(self, color, battery_capacity, serial_number):
        super().__init__("15", color, battery_capacity)
        self._serial_number = serial_number

    @property
    def serial_number(self):
        return self._serial_number

    @serial_number.setter
    def serial_number(self, value):
        self._serial_number = value

    @staticmethod
    def face_id_authentication():
        return "Face ID authentication successful."

    def get_info(self):
        return (f"Brand: {self.brand}, \n"
                f"Model: {self.model}, \n"
                f"Color: {self.color}, \n"
                f"Battery Capacity: {self.battery_capacity}mAh, \n"
                f"OS: {self.os}, \n"
                f"Serial Number: {self._serial_number}\n")


class IPhone4(iPhone):
    def __init__(self, color, battery_capacity):
        super().__init__("4", color, battery_capacity)

    @staticmethod
    def classic_design():
        return "This is the classic iPhone 4 design."

    def get_info(self):
        return (f"Brand: {self.brand}, \n"
                f"Model: {self.model}, \n"
                f"Color: {self.color}, "
                f"Battery Capacity: {self.battery_capacity}mAh, \n"
                f"OS: {self.os}, "
                f"Design: {self.classic_design()}\n")


iphone15 = IPhone15("Black", 3400, "SN123456")
iphone4 = IPhone4("White", 1420)


print(iphone15.face_id_authentication())
print(iphone4.classic_design())

print(f"Initial serial number: {iphone15.serial_number}")
iphone15.serial_number = "SN654323"
print(f"Updated serial number: {iphone15.serial_number}")

print(iphone15.get_info())
print(iphone4.get_info())

