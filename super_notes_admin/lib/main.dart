import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
