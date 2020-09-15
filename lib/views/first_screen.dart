import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:family_responsibilities/models/task.dart';
import 'package:family_responsibilities/models/user.dart';
import 'package:firebase_database/firebase_database.dart';


class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  User _user = User();
  Task _task = Task();
  List<String> _taskList = [
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today',
    'Fix the car wheel today fix the car wheel today fix the car wheel today'
  ];

  @override
  void initState() {
    _user.userBackgroundColor = 0xFFFFF325; // from the firebase
    _user.userTextColor = 0xFF000000; // from the firebase
    _task.taskContent =
        'Fix the car wheel today fix the car wheel today fix the car wheel today'; // from the firebase
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(

            onPressed: () {/******************/},
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            color: Colors.red,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.chat, color: Colors.white, size: 30),
                  onPressed: (){/*******************/},
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 30),
                  onPressed: (){/*******************/},
                ),
              ],
            ),
          ),
          /****************************************************************/
          body: Container(
            color: Colors.teal,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                ///a stack of 3 aligned columns
                Expanded(
                  child: Stack(
                    children: [
                      ///column #2 - note list tiles
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                //shadow
                                height: 90,
                                margin: EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    //bottomRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                              Container(
                                //list tile container
                                height: 90,
                                margin: EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                  color: Color(_user.userBackgroundColor),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(60),
                                  ),
                                ),
                                child: LongPressDraggable<Task>(
                                  data: _task,
                                  child: ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _task.taskContent,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(_user.userTextColor)
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onTap: () {/**********************/},
                                  ),
                                  childWhenDragging: Container(
                                    height: 55,
                                    color: Colors.transparent,
                                  ),
                                  feedback: Material(
                                    color: Colors.lightGreen,
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Assign to',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: _taskList.length,
                      ),

                      ///column #1 - dad & mom avatars
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),

                      ///column #3 - sons avatars
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
