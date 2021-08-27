import 'dart:async';

import 'package:control_client/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  onInit() {
    this.changePage();
    super.onInit();
  }

  changePage() {
    Timer(Duration(seconds: 5), () {
      Get.toNamed(AppRoutes.HOME);
    });
  }
}
