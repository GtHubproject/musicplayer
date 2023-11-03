import 'dart:ui';

import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class LibraryController extends GetxController {
  //final audioQuery = OnAudioQuery();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  //  checkPermission();
  }

  // checkPermission() async {
  //   var prmsn = await Permission.storage.request();
  //   if (prmsn.isGranted) {
  //     return audioQuery.querySongs(
  //       ignoreCase: true,
  //       orderType: OrderType.ASC_OR_SMALLER,
  //       sortType: null,
  //       uriType: UriType.EXTERNAL,
  //     );
  //   } else {
  //     checkPermission();
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
