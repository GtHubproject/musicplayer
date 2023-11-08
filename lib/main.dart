import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:musicplayer/app/data/model/song_model.dart';
import 'package:musicplayer/constants/colors.dart';

import 'app/routes/app_pages.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  //   final appDocumentDir = await Path_p.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);
  await Hive.initFlutter();
  // Register your Hive adapters (for SongModel, PlaylistModel, etc.)
  Hive.registerAdapter(SongModelAdapter());
 // Hive.registerAdapter(PlaylistModelAdapter());
Future<void> openBoxes() async {
  await Hive.openBox<SongModel>('songs_and_favorites'); // Single box for all songs and favorites
} 
 await openBoxes();

  
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colours.scafColor),
    );
  }
}
