import 'package:flutter_forge/app/controller/theme_controller.dart';
import 'package:flutter_forge/app/service/storage_service.dart';
import 'package:flutter_forge/config/databases/ILocalDb.dart';
import 'package:get/get.dart';

final dbContext = Get.find<ILocalDb>();
final storage = Get.find<StorageService>();
final themeController = Get.find<ThemesController>();
// final initializeController = Get.find<InitializeController>();
