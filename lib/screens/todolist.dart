import 'package:flutter/material.dart';
import 'package:todo_web/models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todosList;

  TodoList({this.todosList});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 250,
          mainAxisSpacing: 100,
          children: List.generate(widget.todosList.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: widget.todosList[index].priority < 5
                      ? Colors.green.shade200
                      : Colors.red.shade200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.todosList[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.todosList[index].content),
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Colors.red.shade800,
                    child: Text("DELETE"),
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        this.widget.todosList.remove(widget.todosList[index]);
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
