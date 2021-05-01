import 'package:flutter/material.dart';
import 'package:todo_web/models/todo.dart';
import 'package:todo_web/screens/addtodo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerContent = TextEditingController();
  TextEditingController _controllerPriority = TextEditingController();
  List<Todo> _todos = [
    Todo(title: "Deneme Başlık", content: "Deneme içerikkkk", priority: 2)
  ];

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
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: TextField(
                                controller: _controllerTitle,
                                decoration: InputDecoration(
                                    hintText: "Please Enter Todo Title",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: TextField(
                                controller: _controllerContent,
                                decoration: InputDecoration(
                                    hintText: "Please Enter Todo Content",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: TextField(
                                controller: _controllerPriority,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Please Enter Todo Priority",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                    child: Text("Kayder"),
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
                Container(
                    height: 750,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 5,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        children: List.generate(_todos.length, (index) {
                          return Center(
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _todos[index].priority < 5
                                      ? Colors.green.shade200
                                      : Colors.red.shade200),
                              child: Column(
                                children: [
                                  Text(_todos[index].title),
                                  Text(_todos[index].content),
                                ],
                              ),
                            ),
                          );
                        })))
              ],
            ),
          ),
        ));
  }
}
