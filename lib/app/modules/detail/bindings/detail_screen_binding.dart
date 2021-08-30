import 'package:control_client/app/modules/detail/controllers/detail_screen_controller.dart';
import 'package:get/get.dart';

class DetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailScreenController(), permanent: false);
  }
}
