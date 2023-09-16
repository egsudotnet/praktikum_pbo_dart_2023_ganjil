import 'package:flutter/material.dart';

class DrawerExample  extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer (Menu Slide-in)'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu Utama'),
              ),
              ListTile(
                title: const Text('Pilihan 1'),
                onTap: () {
                  // Aksi yang dilakukan saat pilihan 1 dipilih
                },
              ),
              ListTile(
                title: const Text('Pilihan 2'),
                onTap: () {
                  // Aksi yang dilakukan saat pilihan 2 dipilih
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Konten Utama'),
        ),
      ),
    );
  }
}
