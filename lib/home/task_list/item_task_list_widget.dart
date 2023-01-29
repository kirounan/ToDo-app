import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:p2_todo/firebase_utils.dart';
import 'package:p2_todo/model/task.dart';
import 'package:p2_todo/my_theme.dart';

class ItemTaskListWidget extends StatelessWidget {
  Task task;
  ItemTaskListWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),

        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,

          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          // dismissible: DismissiblePane(onDismissed: () {}
          //
          // ),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {
                deleteTaskFromFireStore(task)
                    .timeout(Duration(milliseconds: 500), onTimeout: () {
                  print('delete');
                });
              },
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              backgroundColor: MyThemeData.redColor,
              foregroundColor: MyThemeData.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: MyThemeData.whiteColor,
              borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyThemeData.primaryLight,
                    borderRadius: BorderRadius.circular(40)),
                height: 80,
                width: 5,
              ),
              Column(
                children: [
                  Text(task.title,
                      style: Theme.of(context).primaryTextTheme.headline2),
                  Text(task.description)
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: MyThemeData.primaryLight.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      color: MyThemeData.whiteColor,
                      size: 30,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
