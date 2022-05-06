import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/home/filterpage.dart';
import 'package:projectinit/pages/join_gathering/gathering_nearby.dart';

class AllGatherings extends StatelessWidget {
  AllGatherings({
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot> gatheringsStream = FirebaseFirestore.instance
      .collection('hospitalsupport')
      .doc("gatheringtype")
      .collection("gatherings")
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("All Gatherings"),
        actions: [
          PopupMenuButton(
              icon: const Text("Filter"),
              itemBuilder: (context) => List.generate(
                  buttons.length,
                  (index) => PopupMenuItem(
                      onTap: () {
                        Get.to(() => const FilterGathering(),
                            arguments: buttons[index].title!);
                      },
                      child: InkWell(
                          onTap: () {
                            Get.to(() => const FilterGathering(),
                                arguments: buttons[index].title!);
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              // color: Colors.red,
                              width: double.infinity,
                              child: Text(buttons[index].title!)))))),
          // InkWell(
          //     onTap: () {
          //       Get.to(() => FilterGathering());
          //     },
          //     child: const Text("Filter"))
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: gatheringsStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            int i = 0;
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            return ListView(
              // physics: const AlwaysScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                i++;
                // snapshot.data!.docs.length;
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  // contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  leading: CircleAvatar(
                      backgroundColor: Colors.red, child: Text(i.toString())),

                  // leading:
                  //     const CircleAvatar(child: Icon(CupertinoIcons.person)),
                  title: Text(data["username"].toString() +
                      " \n" +
                      "Meeting Date:\t ${data["date"]}\n Location: \t${data["location"]}\n Meeting type:\t ${data["type"].toUpperCase()}"),
                  // trailing: Text(data['location']),
                  // subtitle: Text(data.toString()),
                );
              }).toList(),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final date = TextEditingController();
      //     Get.bottomSheet(Container(
      //       color: Colors.grey,
      //       padding: const EdgeInsets.all(18),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           CustomInputField(
      //             label: 'Date',
      //             controller: date,
      //           ),
      //           CustomInputField(
      //             label: 'Date',
      //             controller: date,
      //           ),
      //           CustomInputField(
      //             label: 'Date',
      //             controller: date,
      //           ),
      //         ],
      //       ),
      //     ));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
