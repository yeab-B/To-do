import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('My First App'),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔷 Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Hi There 👋",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // 🔷 Text Below Banner
              Text(
                "I write my first app, what about you?\n from YAB.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 30),

              // 🔷 Smart UI Card + Buttons + Icons
              Card(
                elevation: 8,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue, size: 30),
                          SizedBox(width: 10),
                          Text(
                            "My First App Card",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(Icons.task_alt, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Add Tasks Easily", style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.done_all, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Complete & Track Work", style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.lightbulb_outline, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Learn & Grow Everyday", style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      SizedBox(height: 20),

                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text("Start Now"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
