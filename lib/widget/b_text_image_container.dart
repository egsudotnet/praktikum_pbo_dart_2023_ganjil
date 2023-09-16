import 'package:flutter/material.dart';


class TextImageContainerExample extends StatelessWidget {
  const TextImageContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Widget Text-Image-Container"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Selamat datang di Flutter!',
                style: TextStyle(fontSize: 50),
              ),
              Image.asset('images/contoh-image.jpg', width: 200.0, height: 200.0),
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
