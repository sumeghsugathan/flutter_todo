import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //hive box
  final _myBox = Hive.box("mybox");

  //first time ever open the app
  void createInitData() {
    toDoList = [
      ["Do homework", false],
      ["Exercise", false],
    ];
  }

  //load the data from db
  void loadData() {
    final List? data = _myBox.get("TODOLIST");
    toDoList = data ?? [];
  }

  //update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
