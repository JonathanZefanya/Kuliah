import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../utils/DbHelper.dart';
import '../views/addTodo.dart';

class Homepage extends StatefulWidget {
  final int id;
  final String judul;
  final String deskripsi;
  bool isDone;
  final Function deleteFunction;
  final Function isChacked;

  Homepage(
      {required this.id,
      required this.judul,
      required this.deskripsi,
      required this.isDone,
      required this.deleteFunction,
      required this.isChacked,
      Key? key})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Sudut melengkung
        ),
        elevation: 4.0,
        shadowColor: Colors.grey.withOpacity(0.2), // Warna bayangan
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding untuk ruang lebih
          child: Row(
            children: [
              Checkbox(
                value: widget.isDone,
                activeColor: Colors.blue, // Warna aktif modern
                onChanged: (bool? value) {
                  setState(() {
                    widget.isDone = value!;
                    widget.isChacked(widget.id, value);
                  });
                },
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero, // Menghilangkan padding default
                  title: Text(
                    widget.judul,
                    style: TextStyle(
                      fontSize: 18.0, // Ukuran font lebih besar
                      fontWeight: FontWeight.bold, // Teks judul lebih tebal
                      decoration: widget.isDone
                          ? TextDecoration.lineThrough
                          : null,
                      decorationThickness: 2,
                      color: widget.isDone ? Colors.grey : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    widget.deskripsi,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: widget.isDone ? Colors.grey : Colors.black54,
                      decoration: widget.isDone
                          ? TextDecoration.lineThrough
                          : null,
                      decorationThickness: 2,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(width: 8.0), // Jarak antara ListTile dan ikon
              IconButton(
                onPressed: () {
                  widget.deleteFunction(widget.id);
                },
                icon: Icon(Icons.close, color: Colors.redAccent), // Ikon warna merah
              ),
            ],
          ),
        ),
      ),
    );
  }
}
