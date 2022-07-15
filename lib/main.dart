import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_example/todo_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (BuildContext context) => TodoProvider(),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Todo Application",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white70,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                "02 : 36 PM",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "current time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ), //to show the clock

          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(60)),
                    color: Colors.white),
                child: Consumer<TodoProvider>(
                  builder: (context, todo, child) {
                    return ListView.builder(
                        itemCount: todo.taskList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(
                                  left: 32, right: 32, top: 8, bottom: 8),
                              title: Text(
                                todo.taskList[index].title,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                todo.taskList[index].detail,
                                style: const TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                bottom: 8, left: 16, right: 16),
                          );
                        });
                  },
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<TodoProvider>(context,listen: false).addTaskInList();
        },
      ),
    );
  }
}
