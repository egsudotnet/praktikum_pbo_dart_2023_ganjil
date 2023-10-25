import 'package:path/path.dart';
import 'package:praktikum_flutter_pbo/widget/m_c_update_barang.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

import 'm_b_tambah_barang.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'barangs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Barang (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        harga REAL
      )
    ''');
  }

  Future<int> insertBarang(Barang barang) async {
    Database db = await instance.database;
    return await db.insert('Barang', barang.toMap());
  }

  Future<List<Barang>> queryAllBarangs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('Barang');
    return List<Barang>.from(result.map((map) => Barang.fromMap(map)));
  }

  Future<int> updateBarang(Barang barang) async {
    Database db = await instance.database;
    return await db.update('Barang', barang.toMap(), where: 'id = ?', whereArgs: [barang.id]);
  }

  Future<int> deleteBarang(int id) async {
    Database db = await instance.database;
    return await db.delete('Barang', where: 'id = ?', whereArgs: [id]);
  }
}

class Barang {
  final int? id;
  final String nama;
  final double harga;

  Barang({this.id, required this.nama, required this.harga});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
    };
  }

  factory Barang.fromMap(Map<String, dynamic> map) {
    return Barang(
      id: map['id'],
      nama: map['nama'],
      harga: map['harga'],
    );
  }
}

// void main() {
//   runApp(const MyCrudLocal());
// }

class MyCrudLocal extends StatelessWidget {
  const MyCrudLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Barang> barangs = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List<Barang> result = await DatabaseHelper.instance.queryAllBarangs();
    setState(() {
      barangs = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
      ),
      body: ListView.builder(
        itemCount: barangs.length,
        itemBuilder: (context, index) {
          Barang barang = barangs[index];
          return ListTile(
            title: Text(barang.nama),
            subtitle: Text('Harga: \$${barang.harga.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteBarang(barang.id!);
              },
            ),
            onLongPress: (){              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UpdateBarangScreen(barang: barang,)),
              ).then((result) {
                if (result == true) {
                  fetchData(); // Memuat ulang daftar barang
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // // Navigasi ke halaman tambah barang baru
          // // Contoh:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddBarangScreen()),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBarangScreen()),
          ).then((result) {
            if (result == true) {
              fetchData(); // Memuat ulang daftar barang
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void deleteBarang(int id) async {
    int result = await DatabaseHelper.instance.deleteBarang(id);
    if (result > 0) {
      fetchData();
    }
  }
}
