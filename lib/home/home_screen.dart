import 'package:flutter/material.dart';
import 'package:p2_todo/my_theme.dart';
import 'package:p2_todo/home/settings/settings_tab.dart';
import 'package:p2_todo/home/task_list/AddTaskBottomSheet.dart';
import 'package:p2_todo/home/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: MyThemeData.whiteColor,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(50)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          currentIndex: SelectedIndex,
          onTap: (index) {
            SelectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_list.png'),
                ),
                label: 'Task list'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_settings.png'),
                ),
                label: 'Settings'),
          ],
        ),
      ),
      body:tabs[SelectedIndex] ,
    );
  }
  List<Widget> tabs = [TaskListTab(),SettingTab()];

  void addTaskBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>AddTaskBottomSheet());
  }
}
