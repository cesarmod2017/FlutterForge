import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    requestPermissions();
  }

  void requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
      Permission.camera,
      Permission.manageExternalStorage,
      Permission.accessMediaLocation,
    ].request();

    // Check if all permissions were granted
    if (statuses.values.every((status) => status.isGranted)) {
      print("All necessary permissions granted.");
    } else {
      print("Not all necessary permissions were granted.");
    }
  }
}
