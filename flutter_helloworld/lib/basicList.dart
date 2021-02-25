import 'package:flutter/material.dart';

class BasicListApp extends StatelessWidget {
  const BasicListApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Text('Basic List Demo'),
        ),
        body: ListView(
          children: [
            userSection,
            textSection,
          ],
        ));
    var materialApp = MaterialApp(
      title: 'Basic List Demo',
      home: scaffold,
    );
    return materialApp;
  }
}

Widget userSection = Container(
  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  child: Row(
    children: [
      Icon(Icons.av_timer),
      Padding(padding: EdgeInsets.only(right: 15)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Oeschinen Lake Campground',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 4)),
          Text(
            'Kandersteg, Switzerland',
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
          ),
        ],
      )
    ],
  ),
);
Widget textSection = Container(
  padding: const EdgeInsets.all(20),
  child:
      Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.'),
);
