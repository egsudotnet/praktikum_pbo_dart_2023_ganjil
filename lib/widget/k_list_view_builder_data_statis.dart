import 'package:flutter/material.dart';

// model
class Item {
  final String name;
  final String description;
  int price;

  Item(this.name, this.description, this.price);
}

class ListViewBuilderDataStatis extends StatelessWidget {

 final List<Item> items = [
  Item("Item 1", "Deskripsi Item 1", 7000),
  Item("Item 2", "Deskripsi Item 2", 5000),
  Item("Item 3", "Deskripsi Item 3", 3000)
  
 ];

  ListViewBuilderDataStatis({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh List View Builder"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].name),
              subtitle: Text("${items[index].description} Rp.${items[0].price}"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("images/contoh-image.jpg"), // No matter how big it is, it won't overflow
                ),
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Detail Item"),
                      content: Text ("Nama ${items[index].name}\nDeskripsi: ${items[index].description}\nRp.${items[0].price}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  });
              },
            );
          },
        ),
      ),
    );

  }
}
