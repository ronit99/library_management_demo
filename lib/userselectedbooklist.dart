import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'model.dart';
import 'categories.dart';
import 'userlistofadmin.dart';






class booksuserlisted extends StatefulWidget {
  @override
  _booksuserlistedState createState() => _booksuserlistedState();
}

class _booksuserlistedState extends State<booksuserlisted> {
  List<String> litems = [""];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Purchased books"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: Booksname.length, // the length
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset('assets/iconfinder_books_514941.png'),
                      title: Text(Booksname[index]),
                      subtitle: Text('3/20 remaining'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  _showDialog() async {
    await showDialog<String>(
      context: context,

      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Center(child: Text("Edit Name")),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Edit name', hintText: 'eg. John Smith'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
