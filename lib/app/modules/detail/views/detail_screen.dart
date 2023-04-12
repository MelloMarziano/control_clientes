import 'package:control_client/app/modules/detail/controllers/detail_screen_controller.dart';
import 'package:control_client/app/modules/shared_widget/dialog_confirm.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailScreenController>(
      init: DetailScreenController(),
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                color: Color(0xFFf4f6fa),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1358f8),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.HOME);
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 32,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Icon(Icons.chevron_left),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              _.customer.length > 0 ? _.customer[0].name : "",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 25),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _.customer.length > 0
                                      ? _.customer[0].phone
                                      : "",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 18),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                height: MediaQuery.of(context).size.height * 0.67,
                width: double.infinity,
                color: Color(0xFFf4f6fa),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "ID",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Address",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Actions",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: ListView.builder(
                                    addAutomaticKeepAlives: true,
                                    itemCount: _.address.length <= 0
                                        ? _.address.length + 1
                                        : _.address.length,
                                    itemBuilder: (context, i) {
                                      return _.address.length > 0
                                          ? _addressWidget(
                                              _.address[i].addressId,
                                              _.address[i].address,
                                            )
                                          : Center(
                                              child: Text(
                                                  "No hay data, agrega una direccion"),
                                            );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _.inputController.text = "";
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: contentBox(context, _),
                              );
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 50,
                          width: double.infinity,
                          color: Colors.blue.shade300,
                          child: Text("Add Address"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressWidget(int id, String address) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Text(
            id.toString(),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(address),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tour),
          ),
        ],
      ),
    );
  }

  Widget contentBox(context, DetailScreenController controller) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 15,
            ),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: controller.inputController,
                  decoration: InputDecoration(
                    hintText: "Agrega un direccion",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    controller.saveCustomerAddres();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF00C8C8),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      ("SAVE ADDRESS"),
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 35,
          right: 5,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.center,
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.6, 0.6),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Text(
                "X",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF00C8C8),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
