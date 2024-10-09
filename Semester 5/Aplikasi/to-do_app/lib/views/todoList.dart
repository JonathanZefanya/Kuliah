import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import '../utils/DbHelper.dart';
import '../views/homePage.dart';

class TodoList extends StatelessWidget {
  final Function deleteFunction;
  final Function isChacked;

  var db = DbHelper();
  TodoList({
    required this.deleteFunction,
    required this.isChacked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.queryAllRows(),
        builder: ((context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? Center( // Berada di Tengah
                  // Jika data kosong muncul gambar Nahida dengan ukuran 100 x 100 dan Text "Belum Ada Data Sayang"
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/nahida.jpeg',
                        width: 100,
                        height: 100,
                      ),
                      const Text('Kamu Nganggur Nih Sayang'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => Homepage(
                    id: data[i].id,
                    judul: data[i].judul,
                    deskripsi: data[i].deskripsi,
                    isDone: data[i].isDone,
                    deleteFunction: deleteFunction,
                    isChacked: isChacked,
                  ),
                );
        }),
      ),
    );
  }
}
