import 'package:flutter/material.dart';
import 'package:family_responsibilities/views/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        title: 'Family Responsibility Organization',
        home: FirstScreen(),
        //home: AddModifyTask(),
        theme: ThemeData(
          primaryColor: Colors.teal
        ),
      )
  );
}
