import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'model.dart';
import 'categories.dart';




class categorised_bookslist extends StatefulWidget {
  @override
  _categorised_bookslistState createState() => _categorised_bookslistState();
}

class _categorised_bookslistState extends State<categorised_bookslist> {
  List<String> litems = [""];

  void initState() {
    super.initState();
  }
  var editbooknamestr = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
        title: Center(child: Text("Books name")),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              _showDialogaddbook();
            },
            child: Text("Add"),
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
                        subtitle: Text('5/20 remaining'),
                        onTap: () {
                          editbooknamestr = '';
                          editbooknamestr = Categoryname[index];
                          _showDialog();
                        }
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
                editbooknamestr = '';
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
  _showDialogaddbook() async {
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
                    labelText: 'add Categories', hintText: 'eg. John Smith'),
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

