import 'dart:math';
import 'package:control_client/app/modules/home/controllers/home_screen_controller.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List colors = [
    Colors.red,
    Colors.green,
    Colors.orange.shade600,
    Colors.yellow.shade700,
    Colors.green.shade300,
    Colors.red.shade400
  ];
  final Random random = new Random();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (_) => Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1358f8),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Image.asset(
                  "assets/images/logo_customer.png",
                ),
              ),
            ),
            _searchSection(context),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),
              height: MediaQuery.of(context).size.height * 0.67,
              width: double.infinity,
              color: Color(0xFFf4f6fa),
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: _.customer.length,
                itemBuilder: (context, i) {
                  if (_.customer.length <= 0) {
                    return Center(
                      child: Text("No hay Customer"),
                    );
                  } else {
                    return _contactWidget(
                        _.customer[i].name, _.customer[i].customerId);
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF1358f8),
          onPressed: () {
            Get.offAndToNamed(AppRoutes.NEWCUSTOMER);
          },
        ),
      ),
    );
  }

  Widget _searchSection(var context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      color: Color(0xFFf4f6fa),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactWidget(String nombre, int id) {
    index = random.nextInt(5);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF222B45),
            offset: Offset(0, 0.01), //(x,y)
            blurRadius: 0.02,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: colors[index],
            child: Text(nombre.substring(0, 1)),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Text(nombre),
          ),
          GestureDetector(
            onTap: () {
              Get.offAndToNamed(AppRoutes.DETAIL, arguments: id);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Color(0xFFf4f5fe),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
