import 'package:control_client/app/modules/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Control',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SplashScreen(),
      initialBinding: SplashScreenBinding(),
      getPages: AppPages.pages,
    );
  }
}
