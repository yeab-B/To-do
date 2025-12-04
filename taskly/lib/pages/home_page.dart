import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;
  Box? _box;

  @override
  void initState() {
    super.initState();

    Hive.openBox('tasks').then((box) {
      setState(() {
        _box = box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    if (_box == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text('Taskly', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: _taskList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskList() {
    List tasks = _box!.values.toList();

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var task = Task.fromMap(tasks[index]);
        return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.done
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(task.timestamp.toString()),
          trailing: Icon(
            task.done ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            color: task.done ? Colors.red : Colors.grey,
          ),
          onTap: () {
            setState(() {
              task.done = !task.done;
              _box!.putAt(index, task.toMap());
            });
          },
          onLongPress: () {
            setState(() {
              _box!.deleteAt(index);
            });
          },
        );
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: const Icon(Icons.add),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            onSubmitted: (_) {
              if (_newTaskContent != null) {
                var task = Task(
                  content: _newTaskContent!,
                  timestamp: DateTime.now(),
                  done: false,
                );
                _box!.add(task.toMap());

                setState(() {
                  _newTaskContent = null;
                });
                Navigator.pop(context);
              }
            },
            onChanged: (value) {
              setState(() {
                _newTaskContent = value;
              });
            },
          ),
        );
      },
    );
  }
}
