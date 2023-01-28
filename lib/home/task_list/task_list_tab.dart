import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:p2_todo/home/my_theme.dart';
import 'package:p2_todo/home/task_list/item_task_list_widget.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 356)),
            lastDate: DateTime.now().add(Duration(days: 356)),
            onDateSelected: (date) => print(date),
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
                  return ItemTaskListWidget();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 5),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
