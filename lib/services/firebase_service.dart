import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class AllServices {
  CollectionReference allServices =
      FirebaseFirestore.instance.collection('allService');
  getAllServices() async {
    var data = await allServices.get();

    return data.docs;
  }

  addService() {
    allServices
        .doc('ABC123')
        .set(
          {'service_name': "Mary Jane", 'info': "18"},
          SetOptions(merge: true),
        )
        .then(
            (value) => print("'full_name' & 'age' merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));
  }
  delete(){
 
  }

  updateService(String data, String id, context) async {
    String message = '';

    try {
      allServices.doc(id).update({'info': data}).then((value) {
        message = ("Data Updated");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          message,
          style: TextStyle(color: Colors.white),
        )));
        return message;
      }).catchError((error) {
        message = ("Failed to update : $error");
        print("error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          message,
          style: TextStyle(color: Colors.white),
        )));
        return message;
      });
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message!,
        style: TextStyle(color: Colors.white),
      )));
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message!,
        style: TextStyle(color: Colors.white),
      )));
    }
    // } on FirebaseException catch (e) {
    //   print(e.message);
    // } on PlatformException catch (e) {
    //   print("exception");
    //   message = e.message!;
    //   return message;
    // }
    // print(message);
    // return message;
  }
}
