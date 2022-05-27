import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/controllers/homeController.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/widgets/reusable.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              getTitleText(context, "Registration Successful"),
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: 90,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              getTitleText(context, "Thank you for your \nregistration"),
              const SizedBox(
                height: 30,
              ),
              titleText(context, "Please click done to reurn to \n main page"),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => Get.to(() =>
                    (homeController.authService.currentUser != null
                        ? const HomePage()
                        : AdminHomePage())),
                child: Container(
                    color: Colors.red[600],
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    child: Text(
                      "Done",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    )),
              )
            ]),
      )),
    );
  }
}
