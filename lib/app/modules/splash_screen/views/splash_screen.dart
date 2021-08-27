import 'package:control_client/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (_) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF00C8C8),
          child: Image.asset(
            "assets/images/logo_customer.png",
            width: 800,
            height: 800,
          ),
        ),
      ),
    );
  }
}
