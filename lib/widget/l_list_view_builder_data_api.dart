import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Meal {
  final String id;
  final String name;
  final String category;
  final String thumbnail;

  Meal(this.id, this.name, this.category, this.thumbnail);
}

class ListViewBuilderDataApi extends StatefulWidget {
  const ListViewBuilderDataApi({super.key});

  @override
  State<ListViewBuilderDataApi> createState() => _ListViewBuilderDataApiState();
}

class _ListViewBuilderDataApiState extends State<ListViewBuilderDataApi> {
  List<Meal> meals = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=a'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsData = data['meals'];

      setState(() {
        meals = mealsData.map((item) => Meal(
          item['idMeal'],
          item['strMeal'],
          item['strCategory'],
          item['strMealThumb'],
        )).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text("Menu makanan"),),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index){          
            return ListTile(
              leading: Image.network(meals[index].thumbnail),
              title: Text(meals[index].name),
              subtitle: Text(meals[index].category),
              onTap: () {
                // Tambahkan aksi yang sesuai saat item dipilih
              },
            );
        }
        ),)
    );
  }
}