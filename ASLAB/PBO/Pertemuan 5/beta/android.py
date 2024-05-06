from main import Smartphone


class Android(Smartphone):
    def __init__(self, brand, model, color, battery_capacity) :
        super().__init__(brand, model, "Android", color, battery_capacity)

    def make_call(self, number) :
        return f"Android phone calling {number}"

    def send_message(self, number, message) :
        return f"Android phone sending message to {number}: {message}"


class SamsungGalaxyS21(Android):
    def __init__(self, color, battery_capacity):
        super().__init__("Samsung", "Galaxy S21", color, battery_capacity)

    @staticmethod
    def high_resolution_camera():
        return "Capturing photo with high resolution camera."

    def get_info(self):
        return (f"Brand: {self.brand}, \n"
                f"Model: {self.model}, \n"
                f"Color: {self.color}, \n"
                f"Battery Capacity: {self.battery_capacity}mAh, \n"
                f"OS: {self.os}, \n"
                f"Camera: {self.high_resolution_camera()} \n")


class GooglePixel(Android):
    def __init__(self, color, battery_capacity):
        super().__init__("Google", "Pixel", color, battery_capacity)

    @staticmethod
    def google_assistant_integration():
        return "Google Assistant is ready to help."

    def get_info(self):
        return (f"Brand: {self.brand}, \n"
                f"Model: {self.model}, \n"
                f"Color: {self.color}, \n"
                f"Battery Capacity: {self.battery_capacity}mAh, \n"
                f"OS: {self.os}, "
                f"Google Assistant: {self.google_assistant_integration()} \n")


samsung_s21 = SamsungGalaxyS21("Blue", 4000)
google_pixel = GooglePixel("Black", 3800)

print(samsung_s21.get_info())
print(google_pixel.get_info())