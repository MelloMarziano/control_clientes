import 'package:control_client/app/modules/home/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController(), permanent: false);
    //Get.lazyPut(() => HomeScreenController());
  }
}
