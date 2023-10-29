import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Library'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tracks'),
              Tab(text: 'Artists'),
              Tab(text: 'Albums'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCategory('Tracks', _buildTracks()),
            _buildCategory('Artists', _buildArtists()),
            _buildCategory('Albums', _buildAlbums()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<Widget> items) {
    return ListView(children: items);
  }

  List<Widget> _buildTracks() {
    return List.generate(10, (index) {
      return ListTile(
        title: Text('Track $index'),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            // Add your like functionality here
          },
        ),
        leading: Icon(Icons.music_note),
      );
    });
  }

  List<Widget> _buildArtists() {
    return List.generate(5, (index) {
      return ListTile(
        title: Text('Artist $index'),
        trailing: Icon(Icons.arrow_forward),
        leading: Icon(Icons.person),
      );
    });
  }

  List<Widget> _buildAlbums() {
    return List.generate(3, (index) {
      return ListTile(
        title: Text('Album $index'),
        trailing: Icon(Icons.arrow_forward),
        leading: Icon(Icons.album),
      );
    });
  }
}
