import 'package:flutter/material.dart';


class TextImageContainer extends StatelessWidget {
  const TextImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Widget Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Selamat datang di Flutter!',
                style: TextStyle(fontSize: 24.0),
              ),
              Image.asset('images/contoh-image.jpg', width: 100.0, height: 100.0),
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Ini adalah contoh Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
