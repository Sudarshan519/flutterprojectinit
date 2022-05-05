import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
