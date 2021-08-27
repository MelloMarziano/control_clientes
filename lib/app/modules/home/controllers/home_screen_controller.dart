import 'package:control_client/app/db/database.dart';
import 'package:control_client/models/customer.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController {
  final box = GetStorage();
  bool _haveCustomer = false;
  get haveCustomer => _haveCustomer;
  List<Customer> _customer = [];
  List<Customer> get customer => _customer;

  @override
  onInit() {
    this.chargeCustomer();
    update();
    super.onInit();
  }

  @override
  onReady() {
    this.chargeCustomer();
    update();
    super.onReady();
  }

  chargeCustomer() async {
    this._customer.clear();
    this._customer = await CustomerDatabase.customer();
    update();
  }
}
