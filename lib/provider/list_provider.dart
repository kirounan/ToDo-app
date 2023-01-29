
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p2_todo/firebase_utils.dart';
import 'package:p2_todo/model/task.dart';

class listProvider extends ChangeNotifier{
  DateTime selectedDate = DateTime.now();
  List<Task> tasklist = [];
  getAllTasksFromFireStore() async{
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().orderBy('date').get();
    // You can remove await and async and put .then() after .get() instead same functionality
    tasklist = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    tasklist = tasklist.where((task){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(selectedDate.day== dateTime.day&&
          selectedDate.month== dateTime.month&&
          selectedDate.year== dateTime.year)
        return true;
      return false;
    }).toList();
    tasklist.sort((Task task1 , Task task2){
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    }); // same as orderby (better) but unfortunately neither of them works
    notifyListeners();
  }
  void changeSelectedDate(DateTime newDate){
    selectedDate = newDate;
    notifyListeners();
  }
}