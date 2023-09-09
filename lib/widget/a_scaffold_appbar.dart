import 'package:flutter/material.dart';

class ScaffoldAppbar extends StatelessWidget {
  const ScaffoldAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Beranda'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman beranda'),
      ),
    );
  }
}