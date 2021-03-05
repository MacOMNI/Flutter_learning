import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class SavedWords extends StatelessWidget {
  final List<WordPair> items;
  const SavedWords(this.items, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Saved Words',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return new ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) {
        return new Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Text(
            items[index].asPascalCase,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        );
      },
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> _items = <WordPair>[];
  Set _saveItems = new Set<WordPair>();
  TextStyle _biggerFont = const TextStyle(fontSize: 18, color: Colors.black);

  void initState() {
    _items.addAll(generateWordPairs().take(30));
    super.initState();
  }

  Widget build(BuildContext context) {
    print("item length = ${_items.length}");
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'Random Words Demo',
          style: const TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: _onPushPressed),
        ],
      ),
      body: _buildItems(),
    );
  }

  void _onPushPressed() {
    print('Push Pressed!');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SavedWords(_saveItems.toList());
    }));
  }

  Widget _buildItems() {
    return new ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _items.length,
      separatorBuilder: (BuildContext context, int index) {
        return new Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(_items[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    bool _isSave = _saveItems.contains(pair);
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(
        _isSave ? Icons.favorite : Icons.favorite_border,
        color: _isSave ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_isSave) {
            _saveItems.remove(pair);
          } else {
            _saveItems.add(pair);
          }
        });
      },
    );
  }
}

class RandomListApp extends StatelessWidget {
  const RandomListApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Random Words Demo',
      theme: new ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: new RandomWords(),
    );
  }
}
