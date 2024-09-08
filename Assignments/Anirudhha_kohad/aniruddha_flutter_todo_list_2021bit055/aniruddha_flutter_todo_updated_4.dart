import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoApp(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Task> tasks = [];
  TextEditingController textEditingController = TextEditingController();
  late ValueNotifier<int> selectedPriorityNotifier; // Using ValueNotifier
  int selectedPriority = 1; // Default priority is 1
  bool isDarkModeEnabled = true;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer in the initState method
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (Task task in tasks) {
      task.priorityNotifier.dispose();
      task.titleNotifier.dispose();
      task.dueDateNotifier.dispose();
    }
    super.dispose();
  }


  // Function to start the timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Call setState to trigger the build method and refresh the list
      setState(() {});
    });
  }

  // Function to add a task to the list
  void addTask() {
    String task = textEditingController.text.trim();
    if (task.isNotEmpty && tasks.length < 5) {
      setState(() {
        tasks.add(Task(
          title: task,
          isCompleted: false,
          priority: selectedPriority,
          dueDate: null,
        )); // Set dueDate initially to null
        textEditingController.clear();
        selectedPriority = 1; // Reset priority after adding a task
        _sortAndGroupTasks();
      });
    } else if (task.isNotEmpty && tasks.length >= 5) {
      // Show a dialog if the maximum number of tasks is reached
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Maximum Tasks Reached'),
          content: const Text('You can only have 5 tasks.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Function to remove a task from the list
  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _sortAndGroupTasks();
    });
  }

  // Function to toggle the completion status of a task
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
    setState(() {
      // Update the UI if the task is completed, priority is changed, and the due date is not null
      if (tasks[index].isCompleted && tasks[index].dueDate != null) {
        tasks[index].dueDateNotifier.value = tasks[index].dueDate;
      }

      // Update the UI if the priority is changed
      tasks[index].priorityNotifier.value = tasks[index].priority;

      // Update the UI if the task name is changed
      tasks[index].titleNotifier.value = tasks[index].title;
    });
  }

  // Function to edit a task
  void editTask(int index) {
    selectedPriorityNotifier = ValueNotifier<int>(tasks[index].priority);
    ValueNotifier<DateTime?> dueDateNotifier =
    ValueNotifier<DateTime?>(tasks[index].dueDate);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Edit Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller:
                    TextEditingController(text: tasks[index].title),
                    maxLength: 150,
                    onChanged: (value) {
                      tasks[index].title = value;
                      tasks[index].titleNotifier.value = value; // Update titleNotifier
                    },
                    decoration: const InputDecoration(labelText: 'Task'),
                  ),
                  Row(
                    children: [
                      const Text('Priority:'),
                      const SizedBox(width: 8.0),
                      ValueListenableBuilder<int>(
                        valueListenable: selectedPriorityNotifier,
                        builder: (context, selectedPriority, child) {
                          return PopupMenuButton<int>(
                            icon: Row(
                              children: [
                                const Icon(Icons.arrow_drop_down,
                                    color: Colors.deepPurple),
                                const SizedBox(width: 8.0),
                                Text('$selectedPriority'),
                              ],
                            ),
                            onSelected: (value) {
                              selectedPriorityNotifier.value = value;
                            },
                            itemBuilder: (context) => List.generate(
                              5,
                                  (index) => PopupMenuItem<int>(
                                value: index + 1,
                                child: Center( // Center the number
                                  child: Text('${index + 1}'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Due Date & Time:'),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () async {
                          DateTime? pickedDateTime = await showDatePicker(
                            context: context,
                            initialDate: dueDateNotifier.value ??
                                DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDateTime != null &&
                              pickedDateTime != dueDateNotifier.value) {
                            BuildContext? currentContext = context;
                            // Use the stored context variable inside the asynchronous block
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: currentContext,
                              initialTime: TimeOfDay.fromDateTime(
                                dueDateNotifier.value ?? DateTime.now(),
                              ),
                            );

                            if (pickedTime != null) {
                              pickedDateTime = DateTime(
                                pickedDateTime.year,
                                pickedDateTime.month,
                                pickedDateTime.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              // Use the stored context variable inside the setState callback
                              setState(() {
                                dueDateNotifier.value = pickedDateTime;
                              });
                            }
                          }
                        },
                        child: ValueListenableBuilder<DateTime?>(
                          valueListenable: dueDateNotifier,
                          builder: (context, dueDate, child) {
                            return Text(
                              dueDate != null
                                  ? 'Due : ${DateFormat('yyyy-MM-dd HH:mm').format(dueDate)}'
                                  : 'Pick a Due Date & Time',
                            );
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          setState(() {
                            dueDateNotifier.value = null; // Clear due date
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tasks[index].priority = selectedPriorityNotifier.value;
                      tasks[index].dueDate = dueDateNotifier.value;

                      // Notify the dueDateNotifier for real-time UI update
                      tasks[index].dueDateNotifier.value =
                          tasks[index].dueDate;

                      Navigator.of(context).pop();
                      _sortAndGroupTasks();
                    });
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper function to sort and group tasks by priority
  void _sortAndGroupTasks() {
    tasks.sort((a, b) => a.priority.compareTo(b.priority));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
          backgroundColor: Colors.blueGrey,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Switch(
                value: isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    isDarkModeEnabled = value;
                  });
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 10.0), // Add this SizedBox for space
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple, // Border color
                  width: 1.0,          // Border width
                ),
                borderRadius: BorderRadius.circular(30.0), // Border radius
              ),
              child: Column(
                children: [
                  const Text(
                    'Task Type',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10.0), // Add some space between title and round boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRoundBox('Completed', backgroundColor: Colors.lightGreen),
                      _buildRoundBox('Scheduled', backgroundColor: Colors.blueGrey),
                      _buildRoundBox('Overdue', backgroundColor: Colors.red),
                      _buildRoundBox('Not Scheduled', backgroundColor: Colors.transparent),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: tasks[index].isCompleted
                            ? Colors.lightGreen
                            : (tasks[index].dueDate != null &&
                            tasks[index]
                                .dueDate!
                                .isBefore(DateTime.now())
                            ? Colors.red
                            : (tasks[index].dueDate != null &&
                            tasks[index]
                                .dueDate!
                                .isAfter(DateTime.now())
                            ? Colors.blueGrey
                            : null)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: tasks[index].isCompleted,
                          onChanged: (value) {
                            toggleTaskCompletion(index);
                          },
                        ),
                        title: ValueListenableBuilder<String>(
                          valueListenable: tasks[index].titleNotifier,
                          builder: (context, title, child) {
                            return Text(
                              title,
                              style: TextStyle(
                                decoration: tasks[index].isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationThickness:
                                tasks[index].isCompleted ? 2.5 : 0.0,
                              ),
                            );
                          },
                        ),
                        /*subtitle: ValueListenableBuilder<int>(
                          valueListenable: tasks[index].priorityNotifier,
                          builder: (context, priority, child) {
                            return Text('Priority: $priority');
                          },
                        ),*/
                        subtitle: ValueListenableBuilder<DateTime?>(
                          valueListenable: tasks[index].dueDateNotifier,
                          builder: (context, dueDate, child) {
                            return Text(
                              dueDate != null
                                  ? 'Due Date & Time: ${DateFormat('yyyy-MM-dd HH:mm').format(dueDate)}'
                                  : 'No due date',
                            );
                          },
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => editTask(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removeTask(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Text('Priority :'),
                      const SizedBox(width: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: PopupMenuButton<int>(
                          icon: Row(
                            children: [
                              const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                              const SizedBox(width: 8.0),
                              Text('$selectedPriority'),
                            ],
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedPriority = value;
                            });
                          },
                          itemBuilder: (context) => List.generate(
                            5,
                                (index) => PopupMenuItem<int>(
                              value: index + 1,
                              child: Center( // Center the number
                                child: Text('${index + 1}'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 100.0, 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: textEditingController,
                        maxLength: 150,
                        maxLines: null,
                        decoration: const InputDecoration(
                          labelText: 'Add a Task',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addTask,
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

Widget _buildRoundBox(String text, {required Color backgroundColor}) {
  return Container(
    width: 110.0,  // Adjust the width of the round box as needed
    height: 60.0, // Adjust the height of the round box as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0), // Half of the width/height to make it round
      border: Border.all(
        color: Colors.deepPurple, // Border color
        width: 1.0,               // Border width
      ),
      color: backgroundColor,    // Background color
    ),
    child: Center(
      child: Text(text),
    ),
  );
}

// Class to represent a task
class Task {
  String title;
  bool isCompleted;
  int priority;
  DateTime? dueDate;

  // Add these ValueNotifier properties
  ValueNotifier<int> priorityNotifier;
  ValueNotifier<String> titleNotifier;
  ValueNotifier<DateTime?> dueDateNotifier;

  Task({
    required this.title,
    required this.isCompleted,
    required this.priority,
    this.dueDate,
  })  : priorityNotifier = ValueNotifier<int>(priority),
        titleNotifier = ValueNotifier<String>(title),
        dueDateNotifier = ValueNotifier<DateTime?>(dueDate);
}