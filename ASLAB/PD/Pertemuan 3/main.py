# File Management
import os
path = 'data/data.txt'
def create_file():
    try:
        file = open(path, 'x')
        file.close()
        print('File created')
    except FileExistsError:
        print('File already exists')
        
def read_file():
    try:
        file = open(path, 'r')
        print(file.read())
        file.close()
    except FileNotFoundError:
        print('File not found')
        
def update_file():
    try:
        file = open('data.txt', 'a')
        tulisan = int(input('Masukan Berapa Kali Data Akan Ditambahkan: '))
        for i in range(tulisan):
            data = input(f'Line ke-{i+1}: ')
            file.write(data + '\n')
        file.close()
        print('Data added')
    except FileNotFoundError:
        print('File not found')
        
def delete_file():
    try:
        os.remove('data.txt')
        print('File deleted')
    except FileNotFoundError:
        print('File not found')
        
def main():
    while True:
        print('MANAGE FILE TXT')
        print('1. Create file')
        print('2. Read file')
        print('3. Update file')
        print('4. Delete file')
        print('5. Exit')
        pilihan = input('Masukan Pilihan: ')
        
        if pilihan == '1':
            create_file()
        elif pilihan == '2':
            read_file()
        elif pilihan == '3':
            update_file()
        elif pilihan == '4':
            delete_file()
        elif pilihan == '5':
            break
        elif pilihan == '6':
            print('Keren anda psikopat')
        else:
            print('Pilihan Tidak Valid')
        input('Press Enter to continue...')
        os.system('cls')
    
if __name__ == '__main__':
    main()