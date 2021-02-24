import 'package:family_responsibilities/models/user.dart';
import 'package:family_responsibilities/models/task.dart';
import 'package:family_responsibilities/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddModifyTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddModifyTaskState();
  }
}

class _AddModifyTaskState extends State<AddModifyTask> {

  List<String> userList;
  Task _task = Task();
  User _user = User();
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userList = _user.fetchUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Material(
        child: Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Add Task',
                  //widget.task.taskId == null ? 'Add Task' : 'Modify Task',
                  style: TextStyle(
                    color: Colors.redAccent,
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
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Task Content',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18,),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18,),
                    cursorColor: Colors.white,
                    controller: _textController,
                    onChanged: (String content) => _task.content = content,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),





                DropdownButton<String>(
                  dropdownColor: Colors.redAccent,
                  hint: Text('Assign to ..'),
                  items: userList.map((String index) {
                    return DropdownMenuItem<String>(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (String selectedItem) {
                    setState(() {
                      _task.assignedUser = selectedItem; // we will use in the raised button
                    });
                  },
                  value: _task.assignedUser,
                ),



                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
