import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
   HomePage();

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight ,  _deviceWidth;
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text('Taskly', style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body:_taskList(),
    );
  }
    Widget _taskList() {
    return ListView(
      children: [
         ListTile(
          title: const Text('Task 1',style: TextStyle(decoration: TextDecoration.lineThrough),),
          subtitle: Text(DateTime.now().toString()),
          trailing: Icon(Icons.check_circle_outline, color: Colors.red),
        ),
      ],
    );
  }
}