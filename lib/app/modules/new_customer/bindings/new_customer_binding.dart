import 'package:control_client/app/modules/home/controllers/home_screen_controller.dart';
import 'package:control_client/app/modules/new_customer/controllers/new_customer_controller.dart';
import 'package:get/get.dart';

class NewCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewCustomerController(), permanent: true);
    //Get.lazyPut(() => NewCustomerController());
  }
}
