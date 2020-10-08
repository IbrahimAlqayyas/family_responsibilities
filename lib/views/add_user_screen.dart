import 'package:family_responsibilities/models/task.dart';
import 'package:flutter/material.dart';
import 'package:family_responsibilities/models/user.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  List<String> userTypeList = ['Admin' , 'User'];
  User _user = User();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Add User',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.blueAccent, borderRadius: BorderRadius.circular(10),),
///********************************************************************************************************
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18,),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18,),
                  cursorColor: Colors.white,
                  controller: _textController,
                  onChanged: (String name) => _user.name = name,
                ),
              ),
              SizedBox(
                height: 40,
              ),
///********************************************************************************************************
                DropdownButton<String>(
                  dropdownColor: Colors.blueAccent,
                  hint: Text('Choose type ..'),
                  items: userTypeList.map((String index) {
                    return DropdownMenuItem<String>(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (String selectedItem) {
                    setState(() {
                      _user.type = selectedItem; // we will use in the raised button
                    });
                  },
                  value: _user.type,
                ),
///********************************************************************************************************

              SizedBox(
                height: 40,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  _user.createUser();
                  _textController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
