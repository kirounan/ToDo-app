import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p2_todo/firebase_utils.dart';
import 'package:p2_todo/model/task.dart';
import 'package:p2_todo/my_theme.dart';
import 'package:p2_todo/home/task_list/item_task_list_widget.dart';
import 'package:p2_todo/provider/list_provider.dart';
import 'package:provider/provider.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  Widget build(BuildContext context) {
    var ListProvider = Provider.of<listProvider>(context);
      ListProvider.getAllTasksFromFireStore();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: ListProvider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 356)),
            lastDate: DateTime.now().add(Duration(days: 356)),
            onDateSelected: (date) {
              ListProvider.changeSelectedDate(date);
            },
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLight,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
            shrink: true,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemTaskListWidget(task:ListProvider.tasklist[index] ,);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 5),
                itemCount: ListProvider.tasklist.length),
          )
        ],
      ),
    );
  }


}
