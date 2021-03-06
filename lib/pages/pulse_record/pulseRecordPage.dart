import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/findPeerSupportGroup/findPeerSupportGroup.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/tracker/tracker.dart';

class PulseRecordPage extends StatelessWidget {
  const PulseRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.red,
            onPressed: () => Get.back(),
          ),
          actions: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "See the record of your pulse",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.red),
          ),
          ...List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: ListTile(
                      tileColor: Colors.red,
                      title: const Text("18/08- 77 pulse/min",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      trailing: SizedBox(
                        // color: Colors.white,
                        width: 60,
                        child: Row(children: const [
                          Icon(FontAwesomeIcons.penToSquare),
                          SizedBox(width: 10),
                          Icon(Icons.delete)
                        ]),
                      ),
                    ),
                  )),
          const SizedBox(
            height: 68,
          ),
          Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text(
              "Add record",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final bool isHome;
  const BottomNavigation({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.grey[200],
              )),
          IconButton(
              onPressed: () {
                Get.to(TrackerPage());
              },
              icon: Icon(
                FontAwesomeIcons.heartPulse,
                color: Colors.grey[200],
              )),
          IconButton(
            onPressed: () {
              if (isHome) {
                Get.to(const FindPeerSupportGroup());
              } else {
                Get.back();
              }
            },
            icon: isHome
                ? Transform.rotate(
                    angle: 15,
                    child: Icon(
                      FontAwesomeIcons.handshake,
                      size: 18,
                      color: Colors.grey[200],
                    ),
                  )
                : Icon(
                    FontAwesomeIcons.houseChimney,
                    color: Colors.grey[200],
                    size: 18,
                  ),
          ),
        ],
      ),
    );
  }
}
