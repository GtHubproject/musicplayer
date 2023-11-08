import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/searchbar_controller.dart';

class SearchbarView extends GetView<SearchbarController> {
  const SearchbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
            hintStyle: TextStyle(color: const Color.fromARGB(255, 235, 228, 228)),
            border: InputBorder.none,
          ),
          style: TextStyle(color: const Color.fromARGB(255, 238, 231, 231)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tracks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, 
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Track $index'),
                  leading: Icon(Icons.music_note), // Replace with your song icon
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
