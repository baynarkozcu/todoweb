import 'package:flutter/material.dart';
import 'package:todo_web/models/todo.dart';
import 'package:todo_web/screens/todolist.dart';
import 'package:todo_web/widgets/custonTextField.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerContent = TextEditingController();
  TextEditingController _controllerPriority = TextEditingController();
  List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade200,
          title: Text("TodoList"),
          centerTitle: true,
          leading: Padding(
              padding: EdgeInsets.only(left: 25), child: Icon(Icons.menu)),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 25), child: Icon(Icons.search ))
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomTextField(
                            text: "Please Enter Your Todo's Title",
                            controller: _controllerTitle,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomTextField(
                            text: "Please Enter Your Todo's Content",
                            controller: _controllerContent,
                            lines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomTextField(
                            text: "Please Enter Your Todo's Priority",
                            controller: _controllerPriority,
                            length: 1,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: RaisedButton(
                                child: Text("Kaydet"),
                                color: Colors.blue,
                                onPressed: () {
                                  setState(() {
                                    _todos.add(Todo(
                                        title: _controllerTitle.text,
                                        content: _controllerContent.text,
                                        priority: int.parse(
                                            _controllerPriority.text)));
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _todos.length != 0
                ? TodoList(
                    todosList: _todos,
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text("There is nothing to do"),
                    ),
                  )
          ],
        ));
  }
}
