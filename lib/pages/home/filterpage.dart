import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/pages/join_gathering/gathering_success.dart';

class FilterGathering extends StatefulWidget {
  const FilterGathering({Key? key}) : super(key: key);

  @override
  State<FilterGathering> createState() => _FilterGatheringState();
}

class _FilterGatheringState extends State<FilterGathering> {
  final CollectionReference gatheringsStream = FirebaseFirestore.instance
      .collection('hospitalsupport')
      .doc("gatheringtype")
      .collection("gatherings");

  filterByType() async {
    var data =
        await gatheringsStream.where("type", isEqualTo: Get.arguments).get();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Search Results"),
      ),
      body: FutureBuilder(
        future: filterByType(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Error loading data");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: List.generate(snapshot.data.docs.length, (index) {
                var document = snapshot.data.docs[index];
                return ListTile(
                  onTap: () {
                    Get.to(const GatheringSuccess());
                  },
                  title: Text(document["username"].toString() +
                      " \n" +
                      "Meeting Date:\t ${document["date"]}\n Location: \t${document["location"]}\n Meeting type:\t ${document["type"].toUpperCase()}"),
                  // subtitle: Text("Meeting location :" + document['location']),
                  // trailing: Text(document['date']),
                  trailing: FirebaseAuth.instance.currentUser == null
                      ? IconButton(
                          onPressed: () async {
                            try {
                              await gatheringsStream.doc(document.id).delete();
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          icon: Icon(Icons.delete))
                      : null,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
