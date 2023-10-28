import 'package:flutter/material.dart';


import 'package:get/get.dart';


class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});
  @override
  Widget build(BuildContext context) {
   return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white, // Background color
      selectedItemColor: Colors.pink, // Selected item color
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: true, // Unselected item color
      items: const [
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
    );

  }

}
