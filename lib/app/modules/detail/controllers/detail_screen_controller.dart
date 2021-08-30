import 'package:control_client/app/db/database.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:control_client/models/address.dart';
import 'package:control_client/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreenController extends GetxController {
  var data = Get.arguments;
  List<Customer> _customer = [];
  List<Customer> get customer => _customer;
  List<Address> _address = [];
  List<Address> get address => _address;
  TextEditingController _inputController = TextEditingController();
  TextEditingController get inputController => _inputController;

  @override
  onInit() {
    this.chargeCustomer();
    this.chargeAddress();
    print(data);
    super.onInit();
  }

  @override
  onReady() {
    this.chargeCustomer();
    this.chargeAddress();
    update();
    super.onReady();
  }

  chargeCustomer() async {
    this._customer.clear();
    this._customer = await CustomerDatabase.customerbyId(data);
    update();
  }

  chargeAddress() async {
    this._address.clear();
    this._address = await CustomerDatabase.customerAddressbyId(data);
    print(this._address.length);
    update();
  }

  saveCustomerAddres() async {
    this._address = await CustomerDatabase.address();
    await CustomerDatabase.insertAddress(
      Address(
          customerId: data,
          address: _inputController.text,
          addressId: this._address.length + 1),
    );
    this.chargeAddress();
    this.chargeCustomer();
    Get.back();
  }
}
