import 'package:flutter/material.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BasicUI",
      home: BasicUI(title: "BasicUI"),
    );
  }
}

class BasicUI extends StatelessWidget {
  const BasicUI({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Center(
        child: Text("Basic build UI!"),
      ),
    );
    return scaffold;
  }
}
