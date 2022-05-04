import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectinit/pages/auth/login/login.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Icon(
                FontAwesomeIcons.heartPulse,
                size: 150,
                color: Colors.red,
              ),
              Text(
                "Heart Support ".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.blue),
              ),
              Text(
                "Australia",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.red[800]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  height: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Call OOO',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  height: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_location,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hospital',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/splash.png",
                height: 200,
                width: double.infinity,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36))),
                      onPressed: () => Get.off(() => LoginPage()),
                      child: const Text("Get Started")))
              // CustomButton(label: "Get Started", route: () {})
            ],
          ),
        ),
      ),
    );
  }
}
