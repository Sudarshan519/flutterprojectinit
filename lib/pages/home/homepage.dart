// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget logoWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 300,
              ),
              Center(
                child: Container(
                  color: Colors.red,
                  height: 45,
                  width: 150,
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: Text(
                        "Call 000",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  color: Colors.red,
                  height: 45,
                  width: 150,
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_location,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: Text(
                        "Hospital",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Image.asset(
                  "assets/donate_blood.png",
                  height: 250,
                  //width: 400,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }
}
