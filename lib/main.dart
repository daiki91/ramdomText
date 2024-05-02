import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomListView(),
    );
  }
}

class RandomListView extends StatefulWidget {
  @override
  _RandomListViewState createState() => _RandomListViewState();
}

class _RandomListViewState extends State<RandomListView> {
  List<String> _items = [];

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Membre team LAAB'),
    );
    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            onTap: () {
              _showDialog(_items[index]);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Text'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "Enter your text"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addItemToList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addItemToList() {
    setState(() {
      _items.add(_textController.text);
      _textController.clear();
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _showDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item choisi'),
          content: Text(item),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
