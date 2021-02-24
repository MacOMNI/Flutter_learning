import 'package:flutter/material.dart';

class BasicListApp extends StatelessWidget {
  const BasicListApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body2 = Column(
      children: [
        textSection,
      ],
    );
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Basic List Demo'),
      ),
      body: body2,
    );
    var materialApp = MaterialApp(
      title: 'Basic List Demo',
      home: scaffold,
    );
    return materialApp;
  }
}

Widget userSection = Container();
Widget textSection = Container(
  child:
      Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.'),
);
