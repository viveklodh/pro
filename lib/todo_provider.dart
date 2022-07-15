import 'package:flutter/cupertino.dart';
import 'package:provider_todo_example/task_model.dart';

class TodoProvider extends ChangeNotifier {

  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel = TaskModel("title ${taskList.length}",
        "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}

