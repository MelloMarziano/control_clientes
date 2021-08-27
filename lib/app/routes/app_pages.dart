import 'package:control_client/app/modules/detail/bindings/detail_screen_binding.dart';
import 'package:control_client/app/modules/detail/views/detail_screen.dart';
import 'package:control_client/app/modules/home/bindings/home_screen_binding.dart';
import 'package:control_client/app/modules/home/views/home_screen.dart';
import 'package:control_client/app/modules/new_customer/bindings/new_customer_binding.dart';
import 'package:control_client/app/modules/new_customer/views/new_customer_screen.dart';
import 'package:control_client/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:control_client/app/modules/splash_screen/views/splash_screen.dart';

import 'app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.NEWCUSTOMER,
      page: () => NewCustomerScreen(),
      binding: NewCustomerBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => DetailScreen(),
      binding: DetailScreenBinding(),
    ),
  ];
}
