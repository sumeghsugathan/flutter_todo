import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';

class TodoProvider with ChangeNotifier {
  String name = "raju";
  ToDoDataBase db = ToDoDataBase();

  void changeName() {
    name = "ambu";
    notifyListeners();
  }

  saveNew(
    TextEditingController controller,
    bool crossed,
    BuildContext context,
  ) {
    db.toDoList.add([]);
    controller.clear();
    Navigator.of(context).pop();
    db.updateDataBase();
    notifyListeners();
    // return controller;
  }
}
