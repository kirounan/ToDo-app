import 'package:flutter/material.dart';
import 'package:p2_todo/firebase_utils.dart';
import 'package:p2_todo/my_theme.dart';

import '../../model/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';
  DateTime SelectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add new Task',
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          Form(
            key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter task title'),
                onChanged: (text){
                  title=text;
                },
                validator: (text){
                  if(text==null||text.isEmpty){
                    return 'Please enter task title'; // invalid
                  }
                  return null; // valid
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'task Description',
                ),
                validator: (text){
                  if(text==null||text.isEmpty){
                    return 'Please enter task description'; // invalid
                  }
                  return null; // valid
                },

                onChanged: (text){
                  description=text;
                },
                maxLines: 2,
                minLines: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Select Date',
                  style: Theme.of(context).primaryTextTheme.subtitle1),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  ChooseDate();
                },
                child: Text(
                  '${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}',
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
          InkWell(
            onTap: (){
                addTask();
            },
            child: Container(

              padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow:[BoxShadow(
                    color: MyThemeData.primaryLight.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(3, 3),
                  ),
                ],
                ),
                child: Icon(Icons.check,color: MyThemeData.whiteColor,size: 30,)
            ),
          )
        ],
      ),
    );
  }

  void ChooseDate() async{
   var chosenDate = await showDatePicker(context: context, initialDate: SelectedDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 356)));
 if(chosenDate !=null){
   SelectedDate = chosenDate;
   setState(() {
   });
 }
  }

  void addTask() {
    if(formKey.currentState?.validate()==true){
      Task task= Task(title: title, description: description, date: SelectedDate.millisecondsSinceEpoch);
    addTaskToFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
      print("success");
      Navigator.pop(context);
    });
    }
  }
}

