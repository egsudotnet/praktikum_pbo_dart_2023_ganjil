import 'package:flutter/material.dart';

/// Flutter code sample for [TextField].

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Text Field'),
      ),
      body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan teks',
                border: OutlineInputBorder(),
              ),
            ),
          ),
      ),
    );
  }
}
