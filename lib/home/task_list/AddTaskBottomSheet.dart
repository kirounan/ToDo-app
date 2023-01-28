import 'package:flutter/material.dart';
import 'package:p2_todo/home/my_theme.dart';

class AddTaskBottomSheet extends StatelessWidget {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter task title'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'task Description',
                ),
                maxLines: 4,
                minLines: 4,
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

                },
                child: Text(
                  '27/1/2022',
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
          InkWell(
            onTap: (){

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
}
