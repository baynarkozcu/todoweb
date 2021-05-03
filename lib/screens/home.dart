import 'package:flutter/material.dart';
import 'package:todo_web/models/todo.dart';
import 'package:todo_web/screens/todolist.dart';
import 'package:todo_web/widgets/appbar.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Container(
            color: Colors.yellow.shade300,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 75,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black38,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 75,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black38,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 75,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black38,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.yellow.shade300),
          child: ListView(
            children: [
              CustomAppBar(
                scaffoldKey: _scaffoldKey,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width <= 750
                              ? MediaQuery.of(context).size.width
                              : MediaQuery.of(context).size.width / 3,
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.yellow.shade300),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: CustomTextField(
                                  text: "Please Enter Your Todo's Title",
                                  controller: _controllerTitle,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
                                      child: Text("Ok"),
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
              ),
            ],
          ),
        ));
  }
}
