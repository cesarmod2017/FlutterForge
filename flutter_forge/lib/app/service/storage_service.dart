import 'package:flutter_forge/exports/get_exports.dart';

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
}

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> write(String path, dynamic toStorage) async {
    await GetStorage().write(path, toStorage);
  }

  dynamic read(String path) {
    return GetStorage().read(path);
  }
}

abstract class StorageKeys {
  static String userData = 'user_data';
  static String firebaseToken = 'firebaseToken';
}
