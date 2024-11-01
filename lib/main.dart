// lib/main.dart

import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Menu Makanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[20],
      ),
      home: MenuScreen(),
    );
  }
}

List<MenuItem> menuItems = [
  MenuItem(
    title: "Nasi Goreng",
    description: "Nasi goreng yang lezat dengan ayam, sayuran, dan bumbu spesial.",
    imagePath: 'assets/images/nasi_goreng.jpeg',
  ),
  MenuItem(
    title: "Sate Ayam",
    description: "Sate ayam dengan bumbu kacang yang nikmat.",
    imagePath: 'assets/images/sate_ayam.jpeg',
  ),
  MenuItem(
    title: "Rendang",
    description: "Daging sapi yang dimasak dengan rempah-rempah khas Padang.",
    imagePath: 'assets/images/rendang.jpeg',
  ),

];

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Menu Makanan'),
      ),
      backgroundColor: Colors.blue,
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                menuItems[index].imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(menuItems[index].title),
              subtitle: Text(menuItems[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(menuItem: menuItems[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final MenuItem menuItem;

  DetailScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(menuItem.imagePath),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              menuItem.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

