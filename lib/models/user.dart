import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String type;

  User({@required this.id, @required this.name, @required this.type});

  // Reading data from the user
  String get userName => name;
  String get userType => type;

  /// Create User
  createUser() {
    try {
      final userReference = FirebaseFirestore.instance.collection('users');
      DocumentReference documentReference = userReference.doc(name);
      Map<String, dynamic> userMap = {
        'User Name': name,
        'User Type': type,
      };
      documentReference.set(userMap).whenComplete(() => print('$name has been added successfully!'));
    } catch (e) {
      print(e);
    }
  }

  /// Read User
  readUser() async {
    try {
      final userReference = FirebaseFirestore.instance.collection('users');
      DocumentReference documentReference = userReference.doc(name);
      await documentReference.get().then((snapshot) {
        name = snapshot.data()['User Name'];
        type = snapshot.data()['User Type'];
      });
    } catch (e) {
      print(e);
    }
  }

  /// Update User
  updateUser() {
    try {
      final userReference = FirebaseFirestore.instance.collection('users');
      DocumentReference documentReference = userReference.doc(name);
      Map<String, dynamic> userMap = {
        'User Name': name,
        'User Type': type,
      };
      documentReference.set(userMap).whenComplete(() => print('$name has been updated successfully!'));
    } catch (e) {
      print(e);
    }
  }

  /// delete User
  deleteUser() {
    try {
      final userReference = FirebaseFirestore.instance.collection('users');
      DocumentReference documentReference = userReference.doc(name);
      documentReference.delete().whenComplete(() => print('$name has been deleted successfully!'));
    } catch (e) {
      print(e);
    }
  }

  List<String> fetchUserList(){
    final userReference = FirebaseFirestore.instance.collection('users');
    userReference.get().then((QuerySnapshot snapshot) {
      snapshot.docs.singleWhere((element) => false);
    });
  }

}
