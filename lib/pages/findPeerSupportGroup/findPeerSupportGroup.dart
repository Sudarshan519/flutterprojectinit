import 'package:flutter/material.dart';
import 'package:projectinit/controllers/homeController.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/pages/join_peer_support_group/joinPeerSupportGroup.dart';
import 'package:projectinit/pages/pulse_record/pulseRecordPage.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/register/registrationtype.dart';

buldAppBar(context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.red,
        ),
        onPressed: () {
          Get.back();
        }),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}

const textStyle =
    TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600);

class FindPeerSupportGroup extends StatelessWidget {
  const FindPeerSupportGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    var user = homeController.authService.currentUser;
    print(user);
    return Scaffold(
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            "Find Peer Support Group",
            style: TextStyle(
                color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          if (user == null)
            Text(
              "Register to host a peer support group",
              style: textStyle,
            ),
          if (user == null)
            SizedBox(
              height: 60,
            ),
          if (user == null)
            SizedBox(
                width: 250,
                child: CustomButton(
                    label: 'Register Here',
                    onPressed: () {
                      Get.to(() => RegistrationType());
                    })),
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            "Join the peer support group",
            style: textStyle,
          ),
          SizedBox(
            height: 60,
          ),
          SizedBox(
              width: 250,
              child: CustomButton(
                  label: 'Join Here',
                  onPressed: () {
                    Get.to(() => JoinPeerSupportGroup());
                  }))
        ]),
      ),
      appBar: buldAppBar(context),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class DeviceAppBar extends StatelessWidget {
  const DeviceAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
