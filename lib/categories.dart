import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'model.dart';
import 'categories.dart';
import '';


class admincategories extends StatefulWidget {
  @override
  _admincategoriesState createState() => _admincategoriesState();
}

class _admincategoriesState extends State<admincategories> {
  var editcategorynamestr = '';
  List<String> litems = [""];
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
        title: Center(child: Text("Category name")),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              _showDialogaddcategories();
            },
            child: Text("Add"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.builder(

          itemCount: Categoryname.length, // the length
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Image.asset('assets/iconfinder_books_514941.png'),
                        title: Text(Categoryname[index]),
                        // subtitle: Text('3/20 remaining'),
                        onTap: () {
                          editcategorynamestr = '';
                          editcategorynamestr = Categoryname[index];
                          print(Categoryname[index]);
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
                    labelText: 'Enter name', hintText: 'eg. John Smith'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                editcategorynamestr = '';
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('SAVE'),
              onPressed: () {
                editcategorynamestr = '';
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
  _showDialogaddcategories() async {
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

