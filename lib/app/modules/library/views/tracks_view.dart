// TracksView.dart
import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

import 'package:on_audio_query/on_audio_query.dart';

// class TracksView extends StatefulWidget {
//   const TracksView({super.key});

//   @override
//   State<TracksView> createState() => _TracksViewState();
// }

// class _TracksViewState extends State<TracksView> {

//  final OnAudioQuery _audioQuery = OnAudioQuery();

//   // Indicate if application has permission to the library.
//   bool _hasPermission = false;

//   //  AudioPlayer _audioPlayer = AudioPlayer();
//   // late List<SongModel> _songs;

//   @override
//   void initState() {
//     super.initState();

//     // (Optinal) Set logging level. By default will be set to 'WARN'.
//     //
//     // Log will appear on:
//     //  * XCode: Debug Console
//     //  * VsCode: Debug Console
//     //  * Android Studio: Debug and Logcat Console
//     LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
//     _audioQuery.setLogConfig(logConfig);

//     // Check and request for permission.
//     checkAndRequestPermissions();
//   }

//   checkAndRequestPermissions({bool retry = false}) async {
//     // The param 'retryRequest' is false, by default.
//     _hasPermission = await _audioQuery.checkAndRequest(
//       retryRequest: retry,
//     );

//     // Only call update the UI if application has all required permissions.
//     _hasPermission ? setState(() {}) : null;
//   }

//  @override
//   Widget build(BuildContext context) {
//    // var controller = Get.put(TrackController());

//     return
//      Scaffold(

//       body: Center(
//         child: !_hasPermission
//             ? noAccessToLibraryWidget()
//             : FutureBuilder<List<SongModel>>(
//                 // Default values:
//                 future: _audioQuery.querySongs(
//                   sortType: null,
//                   orderType: OrderType.ASC_OR_SMALLER,
//                   uriType: UriType.EXTERNAL,
//                   ignoreCase: true,
//                 ),
//                 builder: (context, item) {
//                   // Display error, if any.
//                   if (item.hasError) {
//                     return Text(item.error.toString());
//                   }

//                   // Waiting content.
//                   if (item.data == null) {
//                     return const CircularProgressIndicator();
//                   }

//                   // 'Library' is empty.
//                   if (item.data!.isEmpty) return const Text("Nothing found!");

//                   // You can use [item.data!] direct or you can create a:
//                   // List<SongModel> songs = item.data!;
//                   return ListView.builder(
//                     itemCount: item.data!.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(item.data![index].title,),
//                         subtitle: Text(item.data![index].artist ?? "No Artist"),
//                         trailing: const Icon(Icons.favorite),
//                         // This Widget will query/load image.
//                         // You can use/create your own widget/method using [queryArtwork].

//                         // onTap: () {
//                         //   _audioPlayer.play(item.data![index].data);
//                         // },

//                         leading: QueryArtworkWidget(
//                           controller: _audioQuery,
//                           id: item.data![index].id,
//                           type: ArtworkType.AUDIO,
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//       ),

//      );
//   }

// Widget noAccessToLibraryWidget() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.redAccent.withOpacity(0.5),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text("Application doesn't have access to the library"),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () => checkAndRequestPermissions(retry: true),
//             child: const Text("Allow"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:just_audio/just_audio.dart';
//new

// class TracksView extends StatefulWidget {
//   const TracksView({Key? key}) : super(key: key);

//   @override
//   _TracksViewState createState() => _TracksViewState();
// }

// class _TracksViewState extends State<TracksView> {
//   final OnAudioQuery _audioQuery = OnAudioQuery();
//   bool _hasPermission = false;
//   late AudioPlayer _audioPlayer;
//   List<SongModel> _songs = [];

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     checkAndRequestPermissions();
//       _initAudioPlayer();
//   }

//   void _initAudioPlayer() {
//     _audioPlayer.playerStateStream.listen((playerState) {
//       if (playerState.playing) {
//         // Display the media controls when audio starts playing
//         _showBottomMediaBar();
//       } else {
//         // Hide the media controls when audio stops playing
//        _hideBottomMediaBar();
//       }
//     });
//   }
// //1.
//   void _showBottomMediaBar() {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.skip_previous),
//               onPressed: () {
//                 // Logic to skip to the previous track
//               },
//             ),
//             IconButton(
//               icon: Icon(
//                 _audioPlayer.playing ? Icons.pause : Icons.play_arrow,
//               ),
//               onPressed: () {
//                 // Logic to play or pause the audio
//                 _audioPlayer.playing ? _audioPlayer.pause() : _audioPlayer.play();
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.skip_next),
//               onPressed: () {
//                 // Logic to skip to the next track
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
// //2.

//   void _hideBottomMediaBar() {
//    Get.back();// Dismiss the currently shown modal bottom sheet
// }

// checkAndRequestPermissions({bool retry = false}) async {
//     _hasPermission = await _audioQuery.checkAndRequest(retryRequest: retry);
//     _hasPermission ? setState(() {}) : null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: !_hasPermission
//             ? noAccessToLibraryWidget()
//             : FutureBuilder<List<SongModel>>(
//                 future: _audioQuery.querySongs(
//                   sortType: null,
//                   orderType: OrderType.ASC_OR_SMALLER,
//                   uriType: UriType.EXTERNAL,
//                   ignoreCase: true,
//                 ),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text(snapshot.error.toString());
//                   }

//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator();
//                   }

//                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Text("No tracks found!");
//                   }

//                   _songs = snapshot.data!;

//                   return ListView.builder(
//                     itemCount: _songs.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(_songs[index].title),
//                         subtitle: Text(_songs[index].artist ?? "No Artist"),

//                         trailing: const Icon(Icons.favorite),
//                          leading: QueryArtworkWidget(
//                           controller: _audioQuery,
//                           id: _songs[index].id,
//                           type: ArtworkType.AUDIO,
//                         ),
//                         onTap: () {
//                           playTrack(_songs[index].id);
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//       ),
//     );
//   }

//   Future<void> playTrack(int id) async {
//     final song = _songs.firstWhere((element) => element.id == id);
//     await _audioPlayer.setFilePath(song.data);
//     _audioPlayer.play();
//   }

//   Widget noAccessToLibraryWidget() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.redAccent.withOpacity(0.5),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text("Application doesn't have access to the library"),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () => checkAndRequestPermissions(retry: true),
//             child: const Text("Allow"),
//           ),
//         ],
//       ),
//     );
//   }
// }



//update


class TracksView extends StatefulWidget {
  const TracksView({Key? key}) : super(key: key);

  @override
  _TracksViewState createState() => _TracksViewState();
}

class _TracksViewState extends State<TracksView> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  bool _hasPermission = false;
  late AudioPlayer _audioPlayer;
  List<SongModel> _songs = [];
  bool _isPlaying = false;
  SongModel? _currentSong;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    checkAndRequestPermissions();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _audioPlayer.playerStateStream.listen((playerState) {
      setState(() {
        _isPlaying = playerState.playing;
      });
    });
  }

  Future<void> checkAndRequestPermissions({bool retry = false}) async {
    bool hasPermission = await _audioQuery.checkAndRequest(retryRequest: retry);
    setState(() {
      _hasPermission = hasPermission;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _hasPermission ? _buildTrackList() : noAccessToLibraryWidget(),
      ),
    );
  }

  Widget _buildTrackList() {
    return FutureBuilder<List<SongModel>>(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          _songs = snapshot.data!;
          return ListView.builder(
            itemCount: _songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_songs[index].title),
                subtitle: Text(_songs[index].artist ?? "No Artist"),
                leading: QueryArtworkWidget(
                          controller: _audioQuery,
                          id: _songs[index].id,
                          type: ArtworkType.AUDIO,
                        ),
          trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.favorite), // Favorite Icon
            onPressed: () {
              // Logic for handling the favorite action
            },
          ),
          IconButton(
  icon: Icon(Icons.more_vert), // More Vert Icon
  onPressed: () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Rename'),
                onTap: () {
                 // _renameSong(_songs[index]); // Call the method to handle renaming
                Navigator.pop(context); // Close the bottom sheet
                  // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.playlist_add),
                title: Text('Add to Playlist'),
                onTap: () {
                  // Logic for adding to playlist
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  },
),

        ],
      ),
                onTap: () {
                  _showBottomMediaBar(_songs[index]);
                },
              );
            },
          );
        } else {
          return Center(child: Text("No tracks found!"));
        }
      },
    );
  }

  void _showBottomMediaBar(SongModel song) {
    _currentSong = song;

    bool isInitiallyPlaying =
        _audioPlayer != null ? _audioPlayer.playing : false;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
 
 
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  QueryArtworkWidget(
                    controller: _audioQuery,
                    id: song.id,
                    type: ArtworkType.AUDIO,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        song.artist ?? "No Artist",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                        isInitiallyPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      isInitiallyPlaying
                          ? _audioPlayer.pause()
                          : _audioPlayer.play();
                      setState(() {
                        isInitiallyPlaying = !isInitiallyPlaying;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      // Logic to skip to the next track
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    _playSong(song);
  }

//rename function


//  void _renameSong(SongModel song) {
//     setState(() {
//       _songs[_songs.indexOf(song)].title = "New Song Title";
//     });
//   }

// void _renameSong(SongModel song) {
//   String newTitle = ''; // Variable to store the new song title
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Rename Song'),
//         content: TextField(
//           onChanged: (value) {
//             newTitle = value; // Update the new title as the user types
//           },
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Save'),
//             onPressed: () {
//               setState(() {
//                 _songs[_songs.indexOf(song)].title = newTitle;
//               });
//               Navigator.of(context).pop(); // Close the dialog
//             },
//           ),
//         ],
//       );
//     },
//   );
// }



  Future<void> _playSong(SongModel song) async {
    _currentSong = song;
    await _audioPlayer.stop();
    await _audioPlayer.setUrl(song.data);
    await _audioPlayer.play();
  }

  Widget noAccessToLibraryWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Application doesn't have access to the library"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => checkAndRequestPermissions(retry: true),
            child: const Text("Allow"),
          ),
        ],
      ),
    );
  }
}


