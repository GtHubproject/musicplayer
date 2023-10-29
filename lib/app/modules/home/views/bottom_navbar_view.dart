import 'package:flutter/material.dart';


import 'package:get/get.dart';

import 'package:musicplayer/app/routes/app_pages.dart';


// class CustomNavbar extends StatelessWidget {

//   const CustomNavbar({super.key});

//   @override

//   Widget build(BuildContext context) {

//    return BottomNavigationBar(

//       type: BottomNavigationBarType.fixed,

//       backgroundColor: Colors.white, // Background color

//       selectedItemColor: Colors.pink, // Selected item color

//       unselectedItemColor: Colors.black,

//       showSelectedLabels: false,

//       showUnselectedLabels: true, // Unselected item color

//       items: const [

//         BottomNavigationBarItem(

//           icon: Icon(Icons.home),

//           label: 'Home',

//         ),

//         BottomNavigationBarItem(

//           icon: Icon(Icons.search),

//           label: 'Search',

//         ),

//         BottomNavigationBarItem(

//           icon: Icon(Icons.library_music),

//           label: 'Library',

//         ),

//         BottomNavigationBarItem(

//           icon: Icon(Icons.person),

//           label: 'Profile',

//         ),

//       ],

//       currentIndex: 0, // Specify the selected item (Home)

//     );


//   }


// }

//aa

//a

class CustomNavbar extends StatefulWidget {

  const CustomNavbar({Key? key});


  @override

  State<CustomNavbar> createState() => _CustomNavbarState();

}


class _CustomNavbarState extends State<CustomNavbar> {

  int myIndex = 0;

  @override

  Widget build(BuildContext context) {

    return BottomNavigationBar(

      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white, // Background color

      selectedItemColor: Colors.pink, // Selected item color

      unselectedItemColor: Colors.black,

      showSelectedLabels: false,

      showUnselectedLabels: true, // Unselected item color

      currentIndex: myIndex, // Specify the selected item (Home)

      onTap: (index) {

        switch (index) {

          case 0: // Home

            // Navigate to Home or perform other actions if needed

            break;

          case 1: // Search

            Get.toNamed(Routes.SEARCHBAR); // Navigate to the SearchView

            break;

          case 2: // Library

            Get.toNamed(Routes.LIBRARY); // Navigate to the LibraryView

            break;

          case 3: // Profile

            Get.toNamed(Routes.PROFILE);


            break;

          default:

            // Do something for other indexes

            break;

        }

      },


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

    );

  }

}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // Import your routes file

// class CustomNavbar extends StatelessWidget {
//   final int currentIndex;

//   const CustomNavbar({Key? key, required this.currentIndex}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       selectedItemColor: Colors.pink,
//       unselectedItemColor: Colors.black,
//       showSelectedLabels: false,
//       showUnselectedLabels: true,
//       currentIndex: currentIndex,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.library_music),
//           label: 'Library',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//       onTap: (index) {
//         if (index != currentIndex) {
//           Get.offNamed(_getRouteForIndex(index));
//         }
//       },
//     );
//   }

//   String _getRouteForIndex(int index) {
//     switch (index) {
//       case 0:
//         return Routes.HOME;
//       case 1:
//         return Routes.SEARCHBAR;
//       case 2:
//         return Routes.LIBRARY;
//       case 3:
//         return Routes.PROFILE;
//       default:
//         return Routes.HOME;
//     }
//   }
// }

