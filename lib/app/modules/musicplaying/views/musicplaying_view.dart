import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/musicplaying_controller.dart';

class MusicplayingView extends GetView<MusicplayingController> {
  const MusicplayingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: Placeholder(), // Placeholder for album artwork
            ),
            const SizedBox(height: 20),
            const Text(
              'Song Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Artist Name',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40,
                  onPressed: () {
                    // Functionality for previous song
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 60,
                  onPressed: () {
                    // Functionality for play/pause
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 40,
                  onPressed: () {
                    // Functionality for next song
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
