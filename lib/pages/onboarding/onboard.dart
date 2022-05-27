import 'package:flutter/material.dart';
import 'package:projectinit/pages/auth/login/auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 40,
              // ),
              // const Icon(
              //   FontAwesomeIcons.heartPulse,
              //   size: 150,
              //   color: Colors.red,
              // ),
              // Text(
              //   "Heart Support ".toUpperCase(),
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline6!
              //       .copyWith(color: Colors.blue),
              // ),
              // Text(
              //   "Australia",
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline6!
              //       .copyWith(color: Colors.red[800]),
              // ),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: '000',
                  );
                  await launchUrl(launchUri);
                },
                child: Container(
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
                          'Call 000',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://www.google.com/maps/place/Heart+Support+Australia+Ltd/@-35.3342934,149.0717055,13.73z/data=!3m1!5s0x6b17b4a7a5727211:0xd31ebf431311d21!4m6!3m5!1s0x6b17ad78847f4227:0xa99730381df1b9af!8m2!3d-35.3385005!4d149.0901401!15sChZhdXN0cmFsaWEgaGVhcnQgaGVhbHRokgEsZGlzYWJpbGl0eV9zZXJ2aWNlc19hbmRfc3VwcG9ydF9vcmdhbml6YXRpb24?shorturl=1"));
                },
                child: Container(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/signup.png",
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
