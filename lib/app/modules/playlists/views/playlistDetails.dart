import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:musicplayer/app/data/model/box.dart';
import 'package:musicplayer/app/data/model/song_model.dart';
import 'package:musicplayer/app/modules/playlists/widgets/renameDialog.dart';
import 'package:musicplayer/app/modules/playlists/widgets/showDeleteDialog.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../controllers/playlists_controller.dart';

import 'package:musicplayer/app/data/model/songmodel.dart' as MyAppSongModel;

// class  PlaylistsView extends GetView<PlaylistsController> {
//    PlaylistsView({Key? key}) : super(key: key);
//    @override
//   Widget build(BuildContext context) {

//     final OnAudioQuery _audioQuery = OnAudioQuery();
//     return Scaffold(
      
//       body:_buildSongList(),
//     );
//   }
//   Widget _buildSongList() {
//     return ValueListenableBuilder<Box<Playlist>>(
//       valueListenable: Boxes.getPlaylist().listenable(),
//       builder: (BuildContext context, box, _) {
//         // Assuming you have a selectedPlaylist variable in your controller
//         Playlist selectedPlaylist = controller.selectedPlaylist.value;

//         return ListView.builder(
//           itemCount: selectedPlaylist.songPaths.length,
//           itemBuilder: (context, index) {

            
//             // You need to fetch SongModel based on songPaths[index]
          
//             // Replace the SongModel fetch logic with your actual implementation
//             SongModel song = _fetchSongModel(selectedPlaylist.songPaths[index]);

//             return ListTile(
//               title: Text(song.title),
//               subtitle: Text(song.artist ?? "No Artist"),
//               // Add other necessary UI elements for the song
//             );
//           },
//         );
//       },
//     );
//   }



//   // Replace this with your actual implementation to fetch SongModel
   
//   SongModel _fetchSongModel(String songPath) {
//     List<SongModel> songs = _audioQuery.querySongs(
//       sortType: null,
//       orderType: OrderType.ASC_OR_SMALLER,
//       uriType: UriType.EXTERNAL,
//       ignoreCase: true,
//     ) as List<SongModel>;

//     SongModel? foundSong = songs.firstWhere(
//       (song) => song.data == songPath,
//       orElse: () => SongModel(title: 'Unknown Song', artist: 'Unknown Artist', data: ''),
//     );

//     return foundSong!;
//   }
  
// }


class PlaylistsView extends GetView<PlaylistsController> {
  PlaylistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnAudioQuery _audioQuery = OnAudioQuery();

    List<Playlist> playlists = Boxes.getPlaylist().values.toList();
    
     // Print information about each playlist
    for (var playlist in playlists) {
      print('Playlist: ${playlist.playlistName}');
      print('Song Paths: ${playlist.songPaths}');
    }
    
    // Replace this with your actual playlist selection logic
    int selectedPlaylistIndex = 0; // Replace with your logic to get the selected playlist index
    Playlist selectedPlaylist = playlists[selectedPlaylistIndex];

    // Now, you can get the list of song paths from the selected playlist
    List<String> songPaths = selectedPlaylist.songPaths;

    // Assuming you have a way to convert song paths to SongModel, you might do something like this:
    var playlist = songPaths.map((path) {
      // Convert path to SongModel, you need to implement this part
      // For example, assuming SongModel has a constructor that takes a path:
      return MyAppSongModel.SongModel.fromPath(path);
    }).toList();

    List<MyAppSongModel.SongModel> selectedSongs = controller.getSelectedSongs().cast<MyAppSongModel.SongModel>();

    List<MyAppSongModel.SongModel> selectedSongsInPlaylist = playlist.where((song) {
      return selectedSongs.contains(song);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Playlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle the add button action here
              // For example, you can navigate to the add screen
              Get.toNamed('/selectplaylist');
            },
          ),
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
                showRenameDialog(context);
              } else if (value == 'delete') {
                showDeleteDialog(context);
              }
            },
          ),
        ],
      ),
      body: _buildSelectedSongsList(selectedSongsInPlaylist.cast<SongModel>()),
    );
  }

  Widget _buildSelectedSongsList(List<SongModel> selectedSongs) {
    if (selectedSongs.isNotEmpty) {
      return ListView.builder(
        itemCount: selectedSongs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedSongs[index].title),
            subtitle: Text(selectedSongs[index].artist ?? "No Artist"),
            // Add any additional UI elements as needed
          );
        },
      );
    } else {
      return Center(child: Text("No selected songs in playlist"));
    }
  }
}
