import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:musicplayer/app/modules/home/views/home_view.dart';
import 'package:musicplayer/app/modules/library/views/library_view.dart';
import 'package:musicplayer/app/modules/profile/views/profile_view.dart';
import 'package:musicplayer/app/modules/searchbar/views/searchbar_view.dart';

import '../controllers/bottomnavigationbar_controller.dart';

class BottomnavigationbarView extends GetView<BottomnavigationbarController> {
   final currentIndex = 0.obs; // Set initial index

  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  BottomnavigationbarView({Key? key}) : super(key: key);

  final screens = [
    const HomeView(),
    const SearchbarView(),
    const LibraryView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: Obx(
        () => IndexedStack(
          index: bottomnavigationbarController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Container(decoration: BoxDecoration(
          color: Colors.grey.shade200, // Set the background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
          child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        child: Obx(
          ()=> BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.amber.shade400,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              bottomnavigationbarController.changeIndex(index);
            },
            currentIndex: bottomnavigationbarController.selectedIndex.value,
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
          ),
        ),
      ),),
    );
  }
}
