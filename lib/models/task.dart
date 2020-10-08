import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  int id = 0;
  String assignedUser;
  String content;

  Task({@required this.id, @required this.content, @required this.assignedUser});

  // Taking the tasks from the user
  int get taskId => id; // that means return id
  String get taskAssignedUser => assignedUser;

  String get taskContent => content;

  /// Create Task
  createTask() {
    try {
      id++; //numbered documents
      final taskReference = FirebaseFirestore.instance.collection('tasks');
      DocumentReference documentReference = taskReference.doc(id.toString());
      Map<String, dynamic> taskMap = {
        'Task ID': id,
        'Task Content': content,
        'Task Assigned User': assignedUser,
      };
      documentReference.set(taskMap).whenComplete(() => print('Task has been added successfully!'));
    } catch (e) {
      print(e);
    }
  }

  /// Read Task
  readTask() async {
    final taskReference = FirebaseFirestore.instance.collection('tasks');
    DocumentReference documentReference = taskReference.doc(id.toString());
    try {
      await documentReference.get().then((snapshot) {
        id = snapshot.data()['Task ID'];
        content = snapshot.data()['Task Content'];
        assignedUser = snapshot.data()['Task Assigned User'];
      });
      print(id);
      print(content);
      print(assignedUser);
    } catch (e) {
      print(e);
    }
  }

  /// Update Task
  updateTask() {
    try {
      final taskReference = FirebaseFirestore.instance.collection('tasks');
      DocumentReference documentReference = taskReference.doc(id.toString());
      Map<String, dynamic> taskMap = {
        'Task Content': content,
        'Task Assigned User': assignedUser,
      };
      documentReference.set(taskMap).whenComplete(() => print('Task has been updated successfully!'));
    } catch (e) {
      print(e);
    }
  }

  /// Delete Task
  deleteTask() {
    try {
      final taskReference = FirebaseFirestore.instance.collection('tasks');
      DocumentReference documentReference = taskReference.doc(id.toString());
      documentReference.delete().whenComplete(() => print('Task has been deleted successfully!'));
    } catch (e) {
      print(e);
    }
  }
}
