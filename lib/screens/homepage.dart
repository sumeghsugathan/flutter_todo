import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/utils/dialogue_box.dart';
import '../utils/colors.dart';
import '../utils/todo_tiles.dart';

class Demoto extends StatefulWidget {
  const Demoto({super.key});

  @override
  State<Demoto> createState() => _DemotoState();
}

class _DemotoState extends State<Demoto> {
//reference the hive box
  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if this is th fist opening of app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      //already opened
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  // checkbox tap
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
    
  }

//cancel todo
  void cancelTodo() {
    Navigator.of(context).pop();
    _controller.clear();
  }

// save a task
  void saveNew() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

//create a task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNew,
          onCancel: cancelTodo,
        );
      },
    );
  }

//delete a task
  void deleteTodo(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 152, 152),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          "TO DO LIST",
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: const Text("Log Out",style: TextStyle(color: AppColors.textColor),),
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: db.toDoList.isEmpty
          ? const Center(
              child: Text("no tasks available"),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  taskName: db.toDoList[index][0],
                  deleteTask: (context) => deleteTodo(index),
                );
              }),
    );
  }
}
