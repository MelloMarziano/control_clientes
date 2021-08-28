import 'package:get/get.dart';

class DetailScreenController extends GetxController {
  var data = Get.arguments;
  @override
  onInit() {
    print(data);
    super.onInit();
  }
}
