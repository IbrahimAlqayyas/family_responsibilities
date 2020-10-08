import 'package:family_responsibilities/views/user_tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:family_responsibilities/models/task.dart';
import 'package:family_responsibilities/models/user.dart';
import 'package:family_responsibilities/views/add_modify_task.dart';
import 'package:family_responsibilities/views/settings_screen.dart';
import 'package:family_responsibilities/views/chat_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddModifyTask())),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            color: Colors.red,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  // chat button
                  icon: Icon(Icons.chat, color: Colors.white, size: 30),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen())),
                ),
                IconButton(
                  // settings button
                  icon: Icon(Icons.settings, color: Colors.white, size: 30),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen())),
                ),
              ],
            ),
          ),

          ///****************************************************************
          body: Container(
            //color: Colors.teal,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                //a stack of 3 aligned columns
                Expanded(
                  child: Stack(
                    children: [
                      ///column #2 - note list tiles
                      /// ListView Builder
                      /*
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        itemCount: taskList.length,
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(60),
                                  ),
                                ),
                                child: LongPressDraggable<Task>(
                                  data: _task,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text('Ib'),
                                    ),
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${taskList[index].taskContent}',
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddModifyTask(taskId: taskList[index].taskId)));
                                      },
                                    ),
                                    onTap: () {
                                      /// ////// ListTile Tap Code later /////////
                                    },
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
                      ),
                      */

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
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserTasks()));
                                },
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserTasks()));
                                },
                              ),
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
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserTasks()));
                                },
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserTasks()));
                                },
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserTasks()));
                                },
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

















