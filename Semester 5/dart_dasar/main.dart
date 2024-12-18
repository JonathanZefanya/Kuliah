// Method Void
void tambah(int a, int b){
    print(a + b);
}

// Method Non Void
int non_void(int a, int b){
    return a + b;
}

// Method Dinamis
dinamis(int a, int b){
    print (a + b);
}

// Method Optional Parameter
void optionalParameter(int a, [int? b]){
    print(a + (b ?? 0));
}

void main(){
    tambah(10, 10);
    print(non_void(20, 10));
    dinamis(10, 10);
    optionalParameter(10, 10);

    // Method arrow function
    var arrow = (int a, int b) => print(a + b);
    arrow(10, 10);

    // Method Anonymous Function
    var anonymous = (int a, int b){
        return a + b;
    };

    print(anonymous(10, 10));

    // If Else statement
    var nilai = 80;
    if(nilai >= 80){
        print("Nilai A");
    } else if(nilai >= 70){
        print("Nilai B");
    } else if(nilai >= 60){
        print("Nilai C");
    } else {
        print("Nilai D");
    }

    // if else statement with bool
    var isLogin = true;
    if(isLogin){
        print("Anda sudah login");
    } else {
        print("Anda belum login");
    }

    // If Else Statement with Operator Logika
    var suhu = 30;
    if(suhu >= 30 && suhu <= 40){
        print("Suhu Normal");
    } else {
        print("Suhu Tidak Normal");
    }

    // Switch Case
    var grade = "A";
    switch(grade){
        case "A":
            print("Nilai A");
            break;
        case "B":
            print("Nilai B");
            break;
        case "C":
            print("Nilai C");
            break;
        case "D":
            print("Nilai D");
            break;
        default:
            print("Nilai E");
    }

    // Inline Conditional
    var kehadiran = 16;
    var absen = kehadiran >= 13 ? "Anda Boleh Ikut Ujian" : "Anda Tidak Boleh Ikut Ujian";
    print('Status: $absen');
}

