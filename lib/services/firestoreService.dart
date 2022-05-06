import 'package:projectinit/pages/register/register_success.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  initializeFirebase() async {
    await Firebase.initializeApp();
  }

  joinGathering() {}
  registerGathering() {}
  viewAllGathering() {}
  filterData() {}
  Future<void> addUser() {
    return users
        .add({
          'full_name': "fullName", // John Doe
          'company': "company", // Stokes and Sons
          'age': "age" // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

class GatheringService {
  CollectionReference gatherings = FirebaseFirestore.instance
      .collection('hospitalsupport')
      .doc("gatheringtype")
      .collection("gatherings");

  joinGathering(data) async {
    var document = await gatherings.add((data));
    print(document);
    if (document.id.isNotEmpty) {
      Get.to(() => const RegistrationSuccess());
    }
  }
}

final gatheringService = GatheringService();
