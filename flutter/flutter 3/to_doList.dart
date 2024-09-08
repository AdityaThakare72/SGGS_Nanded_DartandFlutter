import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // Entry point of the app where it starts execution
}

// Root widget containing MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoApp(),
    );
  }
}

// Stateful widget managing the Todo app
class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // List to hold Task objects representing to-do items
  List<Task> tasks = [];
  final textEditingController = TextEditingController();

  // Method to add a new task to the list
  void addTask() {
    //Adds a new task to the list.
    // Validates the task input and limits the tasks to a maximum of 5.
    // If the maximum limit is reached, it displays an alert dialog.

    String task = textEditingController.text.trim();
    if (task.isNotEmpty && tasks.length < 5) {
      setState(() {
        tasks.add(Task(title: task, isCompleted: false));
        textEditingController.clear();
      });
    } else if (task.isNotEmpty && tasks.length >= 5) {
      // Show a dialog when the maximum task limit is reached
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Maximum Tasks Reached'),
          content: Text('You can only have 5 tasks.'),
          actions: [
            // TextButton widget is used to
            // create an 'OK' button within the AlertDialog.
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Method to remove a task from the list
  void removeTask(int index) {
    // setState is a method used in
    // Flutter to rebuild the UI when the state of the widget changes.
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Method to toggle task completion status
  // for toggling the completion status
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Expanded(
            // ListView.builder:Creates a scrollable list of
            // items efficiently by constructing the list items on-demand.
            child: ListView.builder(
              // The itemCount is set to tasks.length,
              // indicating the number of items in the list.
              itemCount: tasks.length,

              //itemBuilder specifies how each item
              //in the list should be displayed.
              itemBuilder: (context, index) {
                // ListTile Widget:Represents a single item within the ListView.
                // Each task is displayed as a ListTile containing
                // a Checkbox and a Text widget.
                return ListTile(
                  // Its value property is set to the completion
                  //status of the corresponding task (tasks[index].isCompleted).
                  // The onChanged property calls the toggleTaskCompletion method when the
                  //checkbox is interacted with, toggling the task's completion status.
                  leading: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (value) => toggleTaskCompletion(index),
                  ),
                  title: Text(
                    // Displays the title of the task (tasks[index].title).
                    tasks[index].title,
                    style: TextStyle(
                      decoration: tasks[index].isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  // trailing property represents the widget
                  //displayed on the right side of the tile.
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeTask(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Add a Task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addTask,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
   title (String): Represents the title or description of the task.
   isCompleted (bool): Represents the completion status of the
   task (whether it's completed or not).
*/

// Task class to represent individual tasks
class Task {
  String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});
}
