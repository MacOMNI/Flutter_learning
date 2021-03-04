import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> _items = <WordPair>[];
  TextStyle _biggerFont = const TextStyle(fontSize: 18, color: Colors.black);

  void initState() {
    _items.addAll(generateWordPairs().take(10));
    super.initState();
  }

  Widget build(BuildContext context) {
    print("item length = ${_items.length}");
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Random Words Demo'),
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return new ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _items.length,
      separatorBuilder: (BuildContext context, int index) {
        return new Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        if (index >= _items.length - 1) {
          _items.addAll(generateWordPairs().take(10));

          // setState(() {});
        }
        print("item index = ${index}, item length = ${_items.length}");

        return _buildRow(_items[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
    );
  }
}

class RandomListApp extends StatelessWidget {
  const RandomListApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Random Words Demo',
      home: new RandomWords(),
    );
  }
}
