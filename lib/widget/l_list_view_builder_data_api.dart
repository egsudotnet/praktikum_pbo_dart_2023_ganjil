import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Meal {
  final String id;
  final String name;
  final String category;
  final String thumbnail;
  final String strInstructions;

  Meal(this.id, this.name, this.category, this.thumbnail, this.strInstructions);
}

class ListViewBuilderDataApi extends StatefulWidget {
  const ListViewBuilderDataApi({super.key});

  @override
  State<ListViewBuilderDataApi> createState() => _ListViewBuilderDataApiState();
}

class _ListViewBuilderDataApiState extends State<ListViewBuilderDataApi> {
  List<Meal> meals = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=s'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsData = data['meals'];

      setState(() {
        meals = mealsData.map((item) => Meal(
          item['idMeal'],
          item['strMeal'],
          item['strCategory'],
          item['strMealThumb'],
          item['strInstructions'],
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
              // leading: Image.network(meals[index].thumbnail),
              leading: Hero(
                tag: meals[index].id, // Tag harus unik untuk setiap item
                child: Image.network(meals[index].thumbnail),
              ),
              title: Text(meals[index].name),
              subtitle: Text(meals[index].category),
              onTap: () {
                // Tambahkan aksi yang sesuai saat item dipilih
                Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailPage(meal: meals[index])));
              },
            );
        }
        ),)
    );
  }
}

class MealDetailPage extends StatelessWidget {
  final Meal meal;
  const MealDetailPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.network(meal.thumbnail),            
          Hero(
            tag: meal.id, // Tag harus sama dengan yang digunakan dalam daftar
            child: Image.network(meal.thumbnail),
          ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                meal.category,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                meal.strInstructions,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}