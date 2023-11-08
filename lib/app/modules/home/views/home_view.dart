import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:musicplayer/app/common/widget.dart';
import 'package:musicplayer/app/modules/home/views/drawer_view.dart';
import 'package:musicplayer/app/modules/home/widget/addnew_playlist.dart';
//import 'package:musicplayer/app/modules/home/views/bottom_navbar_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,

        //   backgroundColor: Color.fromARGB(255, 247, 230, 245),
        // backgroundColor: Colors.transparent,
        title: const Text(
          'MUSIFY',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        //backgroundColor: const Color.fromARGB(255, 19, 18, 18), // App bar background color
      ),

    //  drawer:DrawerView(),
      //bottomNavigationBar: const CustomNavbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/folder');
                        },
                        child: Image.asset(
                          'assets/folder.jpeg',
                          height: 100,
                          width: 200,
                        )),
                    CustomSizedBox(),
                    const Text('FOLDER'),
                  ],
                ),

                // favv
                // Column(
                //   children: [
                //     GestureDetector(
                //         onTap: () {
                //           Get.toNamed('/favourites');
                //         },
                //         child: Image.asset('assets/folder.jpeg',
                //             height: 100, width: 150)),
                //     CustomSizedBox(),
                //     const Text('FAVV'),
                //   ],
                // ),
              ],
            ),
          ),

          // ----Main Title: Playlists-----

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Playlists',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showPlaylistDialog(context);
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/playlists');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('assets/images.jpeg',
                              height: 100, width: 150),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Playlist 1', // Replace with your playlist title
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //----Recently played--- //

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Recently Played',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // List of Recently Played Songs
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with your number of recently played songs
              itemBuilder: (context, index) {
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Get.toNamed('/musicplaying');
                    },
                    child: Image.asset(
                      'assets/folder1.jpeg', // Replace with your song image asset
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: const Text('song'), // Replace with your song title
                  subtitle:
                      const Text('party song'), // Replace with your artist name
                  // Add more song details or onTap functionality as needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//a
