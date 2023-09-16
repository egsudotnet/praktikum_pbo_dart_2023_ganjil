import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh List View'),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(title: Text('Item 1')),
            ListTile(title: Text('Item 2')),
            ListTile(title: Text('Item 3')),
            ListTile(title: Text('Item 4')),
            ListTile(title: Text('Item 5')),
            ListTile(title: Text('Item 6')),
            ListTile(title: Text('Item 7')),
            ListTile(title: Text('Item 8')),
            ListTile(title: Text('Item 9')),
            ListTile(title: Text('Item 10')),
            ListTile(title: Text('Item 11')),
            ListTile(title: Text('Item 12')),
            ListTile(title: Text('Item 13')),
            ListTile(title: Text('Item 14')),
            ListTile(title: Text('Item 15')),
            ListTile(title: Text('Item 16')),
            ListTile(title: Text('Item 17')),
            ListTile(title: Text('Item 18')),
            ListTile(title: Text('Item 19')),
            ListTile(title: Text('Item 20')),
            ListTile(title: Text('Item 21')),
            ListTile(title: Text('Item 22')),
            ListTile(title: Text('Item 23')),
            ListTile(title: Text('Item 24')),
            ListTile(title: Text('Item 25')),
            ListTile(title: Text('Item 26')),
            ListTile(title: Text('Item 27')),
            // Tambahkan lebih banyak item sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
