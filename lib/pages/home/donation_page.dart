// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/home/homepage.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  late String _name, _number;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Donate Here",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  "assets/donation.png",
                  height: 180,
                ),
              ),
            ),
            SizedBox(height: 25),
            Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UserName:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Your name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Full name required.";
                        }
                        return null;
                      },
                      onSaved: (name) {
                        _name = name!;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Phone Number:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your number"),
                      validator: (value) {
                        {
                          if (value!.length < 10) {
                            return "Enter valid phone number";
                          }
                        }
                        {
                          if (value.length > 10) {
                            return "Enter valid phone number";
                          }
                        }
                        if (value.isEmpty) {
                          return "Phone number required.";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Credit Card Number:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "0000 0000 0000 0000"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Card number required.";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "0000"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Amount required.";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Get.dialog(AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Successfully Donated",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.check_circle,
                                        size: 25,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          } else {
                            print("Unsuccessful");
                          }
                        },
                        child: Text("Submit"),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
