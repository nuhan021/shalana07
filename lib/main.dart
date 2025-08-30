import 'package:shalana07/app.dart';
import 'package:flutter/material.dart';
import 'package:shalana07/core/services/storage_service.dart';
import 'package:shalana07/core/utils/helpers/app_helper.dart';
import 'package:shalana07/core/utils/logging/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  final avatarIndex = StorageService.getCurrentAvatar;
  if(avatarIndex == '' || avatarIndex == null) {
    StorageService.saveCurrentAvatar('0');
  }
  runApp(const MyApp());
}
