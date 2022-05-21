import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/findPeerSupportGroup/findPeerSupportGroup.dart';
import 'package:projectinit/pages/home/homepage.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';
import 'package:projectinit/pages/tracker/tracker.dart';

class RecordDetailPage extends StatefulWidget {
  const RecordDetailPage({Key? key}) : super(key: key);

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  var records = ['14/08 - 55', '15/08 - 55', '16/08 - 55', '18/08 - 55'];
  var textController = TextEditingController();
  var value = TextEditingController();
  var type = Get.arguments[0];
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "See the record of your $type",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.red),
            ),
            ...List.generate(
                records.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: ListTile(
                        tileColor: Colors.red,
                        title: Text(records[index] + "$type/min",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          // color: Colors.white,
                          width: 60,
                          child: Row(children: [
                            InkWell(
                                onTap: () async {
                                  textController.text =
                                      records[index].split(" ").first;
                                  value.text = records[index].split(" - ")[1];
                                  await Get.bottomSheet(Container( padding:const EdgeInsets.all(18),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize:MainAxisSize.min,
                                        children: [
                                        TextFormField(
                                          controller: textController,
                                          decoration: InputDecoration(
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              isCollapsed: false,
                                              labelText: "Date"),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        TextFormField(
                                          controller: value,
                                          decoration: InputDecoration(
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              isCollapsed: false,
                                              labelText: "Value"),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        CustomButton(
                                            label: "Submit",
                                            onPressed: () {
                                              Get.back();
                                            })
                                      ], )));
                                  records[index] =
                                      textController.text + " - " + value.text;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.penToSquare)),
                            SizedBox(width: 10),
                            InkWell(
                                onTap: () {
                                  records.removeAt(index);
                                  setState(() {});
                                },
                                child: Icon(Icons.delete))
                          ]),
                        ),
                      ),
                    )),
            const SizedBox(
              height: 68,
            ),
            InkWell(
              onTap: () async {
                await Get.bottomSheet(Container(
                  padding:const EdgeInsets.all(18),
                    color: Colors.white,
                    child: Column(children: [
                      TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.headline6,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isCollapsed: false,
                            hintText: '17/05',
                            labelText: "Date"),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        controller: value,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.headline6,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isCollapsed: false,
                            hintText: '45',
                            labelText: "Value"),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomButton(
                          label: "Submit",
                          onPressed: () {
                            Get.back();
                          })
                    ], mainAxisSize: MainAxisSize.min)));
                records.add(textController.text + " - " + value.text);
                setState(() {});
              },
              child: Container(
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
              ),
            )
          ],
        ),
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
