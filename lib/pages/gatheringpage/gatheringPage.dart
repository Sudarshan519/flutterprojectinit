import 'package:flutter/material.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:projectinit/pages/register/registrationtype.dart';

class GatheringPage extends StatelessWidget {
  const GatheringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Align(alignment: Alignment.topLeft, child: BackButton()),
            Text("Cheer up!", style: Theme.of(context).textTheme.titleLarge!
                // .copyWith(color: Colors.white),
                ),
            const SizedBox(
              height: 30,
            ),
            Text("Connect with people and\n share your expericence",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!
                // .copyWith(color: Colors.white),
                ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1469571486292-0ba58a3f068b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29ubmVjdCUyMGhlYXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.fill)),
              // width: 300,
              // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                  label: "Register for Gathering",
                  route: () {
                    Get.to(() => const RegistrationType());
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View your registration",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!
                    // .copyWith(color: Colors.white),
                    ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "View",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red[700], fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                label: "Join Gathering",
                route: () => Get.to(() => JoinGathering()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View your gathering",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!
                    // .copyWith(color: Colors.white),
                    ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "View",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red[700], fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
