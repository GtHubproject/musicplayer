import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:musicplayer/constants/colors.dart';

class AlbumView extends GetView {
  const AlbumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlbumView'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 4),
        child: ListTile(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          
          title: Text('Music Name'),
          subtitle: Text('Artist name'),
         // leading: Icon(Icons.music_note,color: whiteColor,size:32),
        
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Background color
        selectedItemColor: Colors.pink, // Selected item color
        unselectedItemColor: Colors.white, // Unselected item color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Specify the selected item (Home)
      ),
    );
  }
}
