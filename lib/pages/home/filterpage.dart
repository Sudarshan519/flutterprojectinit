import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  title: Text(document["username"].toString()),
                  subtitle: Text("Meeting location :" + document['location']),
                  trailing: Text(document['date']),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
