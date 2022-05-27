import 'package:flutter/material.dart';
import 'package:projectinit/controllers/homeController.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:projectinit/services/firebase_service.dart';
import 'package:projectinit/utils/validators.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final date = TextEditingController();

  final time = TextEditingController();

  final location = TextEditingController();

  final fomrKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  final TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: fomrKey,
            child: Column(children: [
              const Align(alignment: Alignment.topLeft, child: BackButton()),
              Text(
                "Registration",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Post your gathering \ndetails",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1800),
                      lastDate: DateTime(3000));
                  //  print(date);
                  if (date != null) selectedDate = date;
                  // text.text = date.toString();
                  setState(() {});
                },
                child: CustomInputField(
                  isEnable: false,
                  obscureText: false,
                  label: selectedDate.toString().substring(0, 10),
                  controller: text,
                  validator: (String? v) {
                    // if (v! == "") {
                    //   return '* Required';
                    // } else if (v == password.text) {
                    //   return null;
                    // } else {
                    //   return "Password don't match";
                    // }
                  },
                ),
              ),
              // CustomInputField(
              //   validator: validateIsEmpty,
              //   controller: date,
              //   label: "Enter Date",
              // ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  var now = DateTime.now();

                  var pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 3, minute: 04));
                  time.text = pickedTime!.hour.toString() +
                      " : " +
                      (pickedTime.minute < 10
                          ? ('0' + pickedTime.minute.toString())
                          : pickedTime.minute.toString()) +
                      " ";
                },
                child: CustomInputField(
                  isEnable: false,
                  validator: validateIsEmpty,
                  label: time.text,
                  controller: time,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomInputField(
                controller: location,
                validator: validateIsEmpty,
                label: "Enter location",
              ),

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 200,
                  child: CustomButton(
                      label: "Register",
                      onPressed: () {
                        final HomeController homeController = Get.find();

                        if (fomrKey.currentState!.validate()) {
                          // print("validating");
                          var data = {
                            "date": selectedDate.toString().substring(0, 10),
                            "location": location.text,
                            "time": time.text,
                            "type": Get.arguments,
                            "userid":
                                'adminuser', //  homeController.authService.currentUser!.uid,
                            "username": 'admin'
                            //  homeController
                            //     .authService.currentUser!.displayName
                          };
                          // print(data);
                          gatheringService.joinGathering(data);
                        }
                      })),
              const SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Want to register for \ngathering?",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: "\tRegister",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.red[700], fontWeight: FontWeight.bold),
                ),
              ])),
            ]),
          ),
        ),
      ),
    );
  }
}
