import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
import 'model.dart';
import 'userbookslist.dart';
import 'userselectedbooklist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()=> runApp(new usrhome());

class usrhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // theme:new ThemeData(
      //     // primarySwatch:Colors.deepPurple,
      //     // primaryColor: Colors.deepPurple
      // ),
      home: new userdata(),
    );
  }
}
class userdata extends StatefulWidget
{
  @override
  _userdataState createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Categorylist> _namesparty = Categorylist.getCompanies();
  List<DropdownMenuItem<Categorylist>> _dropdownMenuParties;
  Categorylist _selectedname;
  void initState() {
    _dropdownMenuParties = buildDropdownMenuParties(_namesparty);
    super.initState();
  }
  List<DropdownMenuItem<Categorylist>> buildDropdownMenuParties(List companies) {
    List<DropdownMenuItem<Categorylist>> items = List();
    for (Categorylist name in companies) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Text(name.name),
        ),
      );
    }
    return items;
  }
  //update this to include the uid in the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("user"),
        actions: <Widget>[
          // FlatButton(
          //   textColor: Colors.white,
          //   onPressed: () {},
          //   child: Text("Logout"),
          //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          // ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            // new UserAccountsDrawerHeader(
            //     accountName: new Text("codesolution"),
            //     accountEmail: new Text("info@codesolution.co.in"),
            //     currentAccountPicture: new CircleAvatar(
            //       backgroundColor:Colors.red,
            //     )
            // ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text('Menu',style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),),
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title:new Text('My Books',style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),),
              trailing: new Icon(Icons.book),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => booksuserlisted(),),);
              },
            ),
            new ListTile(
              title:new Text('Logout',style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),),
              trailing: new Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body : ListView.builder(
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
                      // onTap: () => onTapped(post),
                    ),
                  ],
                ),
              ),
            );
          }),
    );

  }
// _showDialog() async {
//   await showDialog<String>(
//     context: context,
//
//     child: new AlertDialog(
//       contentPadding: const EdgeInsets.all(16.0),
//       title: Center(child: Text("Edit Name")),
//       content: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new TextField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                   labelText: 'Edit name', hintText: 'eg. John Smith'),
//             ),
//           )
//         ],
//       ),
//       actions: <Widget>[
//         new FlatButton(
//             child: const Text('CANCEL'),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         new FlatButton(
//             child: const Text('SAVE'),
//             onPressed: () {
//               Navigator.pop(context);
//             })
//       ],
//     ),
//   );
// }
}