import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List item = [
    "Breakfast",
    "Meet HR",
    "Lunch",
    "Football match at 7pm",
  ];
  List<bool> checkupdate = [];

  createAlertDialog(BuildContext context) {
    //promise to return string
    TextEditingController customController =
        TextEditingController(); //new texteditingc object
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Your Work Here "),
            content: TextField(
              controller: customController,
            ),
            actions: [
              MaterialButton(
                child: Text("cancel"),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text("submit"),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    //item=['HI'];
    String temp;
    return Scaffold(
      appBar: AppBar(
          title: Text("TODO APP"),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Work",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "3",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                Container(
                  height: height / 2,
                  child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        checkupdate.add(false);
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
                          value: checkupdate[index],
                          onChanged: (bool? value) {
                            setState(() {
                              checkupdate[index] = value!;
                            });
                          },
                          title: Text(item[index]),
                        );
                      }),
                )
              ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            temp = onValue;
            print(temp);
          });

          // setState(() {
          //   //item.add(temp);
          //   print(item);
          // });
        },
        tooltip: 'Add URL',
        child: Icon(Icons.add),
      ),
    );
  }
}
