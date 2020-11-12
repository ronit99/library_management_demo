import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'model.dart';
import 'categories.dart';
import 'userlistofadmin.dart';



class userlist extends StatefulWidget {
  @override
  _userlistState createState() => _userlistState();
}

class _userlistState extends State<userlist> {
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
          title: Text("User list"),
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
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Image.asset('assets/user.png', width: 35,height: 35,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bookslistofuser(),),);
                },
                title: Text('Alex'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/user.png', width: 35,height: 35,),
                onTap: () {
                  print('Card tapped.');
                },
                title: Text('philipe'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/user.png', width: 35,height: 35,),
                onTap: () {
                  print('Card tapped.');
                },
                title: Text('samiy'),
                // trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/user.png', width: 35,height: 35,),
                onTap: () {
                  print('Card tapped.');
                },
                title: Text('john'),
                // dense: true,
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  print('Card tapped.');
                },
                leading: Image.asset('assets/user.png', width: 35,height: 35,),
                title: Text('robert'),
                // subtitle: Text('Here is a second line'),
                // trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        )
    );
  }
}

