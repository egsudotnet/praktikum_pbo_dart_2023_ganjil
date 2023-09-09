import 'package:flutter/material.dart';
import 'package:praktikum_flutter_pbo/widget/c_row_column.dart';
import 'package:praktikum_flutter_pbo/widget/d_elevatedbutton.dart';

import 'widget/a_scaffold_appbar.dart';
import 'widget/b_text_image_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Nama Pengguna'),
              accountEmail: Text('email@example.com'),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('assets/user_profile.jpg'), // Ganti dengan gambar profil Anda sendiri
              // ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Scaffold-Appbar'),
              onTap: () {
                // Tambahkan logika navigasi untuk halaman beranda di sini
                
                // Navigator.pop(context); // Tutup sidebar menu
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaffoldAppbar()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Text-Image-Container'),
              onTap: () {
                // Tambahkan logika navigasi untuk halaman pengaturan di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TextImageContainer()));
              },
            ),
            const Divider(), // Garis pemisah
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Row-Column'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RowColumn()));
              },
            ),
            const Divider(), // Garis pemisah
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('levatedButton (Tombol Berwarna):'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElevatedButtonExample()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Konten Utama Aplikasi'),
      ),
    );
  }
}