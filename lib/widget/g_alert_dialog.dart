import 'package:flutter/material.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Widget Flutter'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pesan'),
                    content: const Text('Ini adalah contoh AlertDialog.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Tampilkan Dialog'),
          ),
        ),
      ),
    );
  }
}
