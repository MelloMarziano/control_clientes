import 'package:control_client/app/modules/detail/controllers/detail_screen_controller.dart';
import 'package:control_client/app/routes/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailScreenController>(
      builder: (_) => Scaffold(
        body: Column(
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
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.HOME);
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
                      height: 60,
                      width: double.infinity,
                      child: Text(
                        "Eliu Ortega",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 25),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
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
            Get.toNamed(AppRoutes.NEWCUSTOMER);
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

  Widget _contactWidget(String nombre, String id) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
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
            backgroundColor: Colors.yellow,
            child: Text(nombre.substring(0, 1)),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Text(nombre),
          ),
          GestureDetector(
            onTap: () {},
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
