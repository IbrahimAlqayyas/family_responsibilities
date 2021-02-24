import 'package:flutter/material.dart';
import 'package:family_responsibilities/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        title: 'Family Responsibility Organization',
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        //home: AddModifyTask(),
        theme: ThemeData(
          primaryColor: Colors.teal
        ),
      )
  );
}
