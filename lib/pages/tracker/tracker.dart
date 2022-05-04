import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child: Text(
              "Welcome Judy",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
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
      ListTile(
        onTap: () {
          Get.to(() => const JoinGathering());
        },
        leading: const Icon(FontAwesomeIcons.heartPulse),
        title: const Text("Pulse Record"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(FontAwesomeIcons.heartCircleCheck),
        title: const Text("Rythm Record"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(FontAwesomeIcons.heartCircleCheck),
        title: const Text("Pressure Record"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(FontAwesomeIcons.houseMedicalCircleExclamation),
        title: const Text("Medication Record"),
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
    ]);
  }
}
