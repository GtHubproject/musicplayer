import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:musicplayer/app/modules/playlists/widgets/renameDialog.dart';
import 'package:musicplayer/app/modules/playlists/widgets/showDeleteDialog.dart';
import '../controllers/playlists_controller.dart';
class PlaylistsView extends GetView<PlaylistsController> {
  //--data
  final List<Map<String, String>> songs = [
    {
      'name': 'Song 1',
      'source': 'Source 1',
    },
    {
      'name': 'Song 2',
      'source': 'Source 2',
    },
    {
      'name': 'Song 3',
      'source': 'Source 3',
    },
  ];
  PlaylistsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist 1'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Rename'),
                  ),
                  value: 'rename',
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                  value: 'delete',
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'rename') {
                showRenameDialog( context);
                
              } else if (value == 'delete') {
                showDeleteDialog(context);
               }
            },
          ),
        ],
      ),
      
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // You can use Image.asset or Icon depending on your implementation
              child: Text('Icon'), // Replace with image or icon widget
            ),
            title: Text(songs[index]['name']!),
            subtitle: Text(songs[index]['source']!),
            trailing: Icon(Icons.more_vert), // Trailing 3-dot icon
            onTap: () {
              // Perform action when a song is tapped
              print('Tapped: ${songs[index]['name']}');
            },
          );
        },
      ),
    );
  }
}
