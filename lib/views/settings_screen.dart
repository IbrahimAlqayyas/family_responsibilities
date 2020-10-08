import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:family_responsibilities/views/add_user_screen.dart';


class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen())),
          label: Text('Add User', style: TextStyle(
            color: Colors.white,
            fontSize: 18

          ),),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5.0,
          color: Colors.red,
          elevation: 5,

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
              ),
            ],
          ),

        ),
      ),
    );
  }
}
