import 'package:control_client/app/modules/new_customer/controllers/new_customer_controller.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCustomerScreen extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xFF1358f8),
    primary: Colors.white,
    minimumSize: Size(double.infinity, 50),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewCustomerController>(
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFF525252),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            margin: EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 30,
            ),
            //height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "New Customer",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _inputRegister("Name", TextInputType.text, _.name),
                  _inputRegister("Phone", TextInputType.number, _.phone),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      _.saveCustomerData();
                      //Get.toNamed(AppRoutes.HOME);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputRegister(String label, TextInputType keyboardType,
      TextEditingController textController) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 30,
      width: double.infinity,
      child: TextField(
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
