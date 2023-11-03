import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class TrackController extends GetxController {
  final audioQuery = OnAudioQuery();
 // final AudioPlayer = AudioPlayer();

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    checkPermission();
  }

  checkPermission() async {
    var prmsn = await Permission.storage.request();
    if (prmsn.isGranted) {
    } else {
      checkPermission();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //void increment() => count.value++;
}
