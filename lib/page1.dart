import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);
  

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  void _show(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
              title: const Text('I am an alert dialog'),
              content: const Text('You are so handsome!'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Close '))
              ],
            ));
  }

  TextEditingController controller = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();

  List<String>? works = [];
  List<bool>? ischecked = [false];

  List<String> checking = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 243, 243),
        appBar: AppBar(
          title: Text(
            "TODO APP",
          ),
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Work',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Text('3'),
                ],
              ),
              Divider(thickness: 3, color: Color.fromARGB(255, 15, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (Value) {},
                      activeColor: Colors.black),
                  Text(
                    "breakfast",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (Value) {}),
                  Text(
                    'Meet with HR',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                  ),
                  Text(
                    'Lunch',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (Value) {},
                    activeColor: Colors.black,
                  ),
                  Text(
                    'Football match at 7pm',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.black,
          splashColor: Colors.blue,
          onPressed: () {
            _show(context);
          },
        ),
      ),
    );
  }
}
