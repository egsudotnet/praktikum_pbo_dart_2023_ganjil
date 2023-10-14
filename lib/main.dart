import 'package:flutter/material.dart';
import 'package:praktikum_flutter_pbo/widget/c_row_column.dart';
import 'package:praktikum_flutter_pbo/widget/d_elevatedbutton.dart';
import 'package:praktikum_flutter_pbo/widget/e_text_fileld.dart';
import 'package:praktikum_flutter_pbo/widget/h_list_view.dart';
import 'package:praktikum_flutter_pbo/widget/k_list_view_builder_data_statis.dart';
import 'package:praktikum_flutter_pbo/widget/l_list_view_builder_data_api.dart';

import 'widget/a_scaffold_appbar.dart';
import 'widget/b_text_image_container.dart';
import 'widget/f_bottom_navigator.dart';
import 'widget/g_alert_dialog.dart';
import 'widget/i_drawer.dart';
import 'widget/j_card.dart';

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
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/flutter_image.jpg"),
                  fit:BoxFit.cover
                )
              ),
              accountName: Text(""),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/contoh-image.jpg'), // Ganti dengan gambar profil Anda sendiri
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Scaffold-Appbar'),
              onTap: () {
                // Tambahkan logika navigasi untuk halaman beranda di sini
                
                // Navigator.pop(context); // Tutup sidebar menu
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaffoldAppbarExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Text-Image-Container'),
              onTap: () {
                // Tambahkan logika navigasi untuk halaman pengaturan di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TextImageContainerExample()));
              },
            ),
            const Divider(), // Garis pemisah
            ListTile(
              leading: const Icon(Icons.grid_3x3),
              title: const Text('Row-Column'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RowColumnExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.ads_click),
              title: const Text('ElevatedButton (Tombol Berwarna):'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElevatedButtonExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_decrease),
              title: const Text('Text Field'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TextFieldExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text('Bottom NavigationBar'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('AlertDialog'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AlertDialogExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List View'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu),
              title: const Text('Drawer (Menu Slide-in)'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DrawerExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_membership_outlined),
              title: const Text('Card'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CardExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_membership_outlined),
              title: const Text('List View Builder - Data Statis'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewBuilderDataStatis()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_outlined),
              title: const Text('List View Builder - Data API'),
              onTap: () {
                // Tambahkan logika untuk keluar dari aplikasi di sini
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewBuilderDataApi()));
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