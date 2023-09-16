import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Card'),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('Judul Kartu'),
                subtitle: Text('Ini adalah contoh Card dalam Flutter.'),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Aksi yang dilakukan ketika tombol ditekan
                    },
                    child: const Text('Aksi 1'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Aksi yang dilakukan ketika tombol ditekan
                    },
                    child: const Text('Aksi 2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
