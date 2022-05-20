import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projectinit/controllers/homeController.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:projectinit/pages/pulse_record/pulseRecordPage.dart';

const padding = 30;

class TrackerPage extends StatelessWidget {
  TrackerPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      drawer: DrawerPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  // child: Icon(CupertinoIcons.person_circle, size: 40),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ListTile(
                  tileColor: Colors.red,
                  title: Text(
                    "Welcome ${homeController.authService.currentUser!.displayName}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ))
                // titleText(context, "Welcome Judy "),
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Keep track of your heart",
                style: Theme.of(context).textTheme.headline6,
              ),
            ), // titleText(context, "Keep track of your heart ", color: Colors.black),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListTile(
                  tileColor: Colors.red,
                  onTap: () {
                    Get.to(() => PulseRecordPage());
                  },
                  // leading: const Icon(
                  //   FontAwesomeIcons.heartPulse,
                  //   color: Colors.red,
                  // ),
                  title: Text(
                    "Pulse Record",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: ListTile(
                tileColor: Colors.red,
                onTap: () {},
                // leading: const Icon(
                //   FontAwesomeIcons.heartCircleCheck,
                //   color: Colors.red,
                // ),
                title: Text(
                  "Rythm Record",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: ListTile(
                tileColor: Colors.red,
                onTap: () {},
                // leading: const Icon(
                //   FontAwesomeIcons.heartCircleCheck,
                //   color: Colors.red,
                // ),
                title: Text(
                  "Pressure Record",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: ListTile(
                tileColor: Colors.red,
                onTap: () {},
                // leading: const Icon(
                //   FontAwesomeIcons.houseMedicalCircleExclamation,
                //   color: Colors.red,
                // ),
                title: Text(
                  "Medication Record",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   child: CustomButton(
            //     label: "Pulse Record",
            //     route: () => Get.to(() => const JoinGathering()),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   child: CustomButton(
            //     label: "Pulse Record",
            //     route: () => Get.to(() => const JoinGathering()),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   child: CustomButton(
            //     label: "Pulse Record",
            //     route: () => Get.to(() => const JoinGathering()),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   child: CustomButton(
            //     label: "Pulse Record",
            //     route: () => Get.to(() => const JoinGathering()),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
