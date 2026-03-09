import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Tinanggal ang shadow sa ilalim ng AppBar para malinis tignan
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200], // Light grey background para sa search box
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search', // Text na nakikita pag walang nakasulat
              prefixIcon: Icon(Icons.search, color: Colors.grey), // Salamin na icon sa kaliwa
              border: InputBorder.none, // Tinanggal ang default underline ng TextField
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
      // GridView.builder: Ginagamit para sa efficient na pag-display ng maraming images
      body: GridView.builder(
        itemCount: 30, // Bilang ng mga images na lalabas
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Tatlong pictures ang magkakatabi sa bawat row
          crossAxisSpacing: 2, // Espasyo sa pagitan ng mga column
          mainAxisSpacing: 2,  // Espasyo sa pagitan ng mga row
        ),
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/id/${index + 20}/300/300', // Kukuha ng random photos online
            fit: BoxFit.cover, // Pupunuin yung box ng image para hindi stretch
          );
        },
      ),
    );
  }
}