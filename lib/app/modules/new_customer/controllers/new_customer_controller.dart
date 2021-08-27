import 'package:control_client/app/db/database.dart';
import 'package:control_client/app/modules/home/controllers/home_screen_controller.dart';
import 'package:control_client/app/modules/home/views/home_screen.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:control_client/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewCustomerController extends GetxController {
  List<Customer> _customer = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  Customer? newCustomer;

  get name => _name;
  get phone => _phone;

  @override
  onInit() {
    super.onInit();
  }

  saveCustomerData() async {
    this._customer = await CustomerDatabase.customer();
    CustomerDatabase.insertCustomer(Customer(
        customerId: this._customer.length + 1,
        name: _name.text,
        phone: _phone.text));
    //print(this.box.read("customer"));
    HomeScreenController s = HomeScreenController();
    s.chargeCustomer();
    Get.off(() => HomeScreen());
  }
}
