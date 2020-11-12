import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
import 'package:dropdown_formfield/dropdown_formfield.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';
import 'categories.dart';
import 'userlist.dart';
import 'userlistofadmin.dart';
import 'userselectedbooklist.dart';
import 'userbookslist.dart';
void main()=> runApp(new homeadmin());

class homeadmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // theme:new ThemeData(
      //     // primarySwatch:Colors.deepPurple,
      //     // primaryColor: Colors.deepPurple
      // ),
      home: new adminpage(),
    );
  }
}
class adminpage extends StatefulWidget
{
  @override
  _adminpageState createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController booknamecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin panel"),
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
              title:new Text('Categories',style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),),
              trailing: new Icon(Icons.category),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => admincategories(),),);
              },
            ),
            new ListTile(
              title:new Text('Books',style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),),
              trailing: new Icon(Icons.book),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => categorised_bookslist(),),);
              },
            ),
            new ListTile(
              title:new Text('Logout',style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),),
              trailing: new Icon(Icons.account_circle),
              onTap: (){
                // SharedPreferences preferences = await SharedPreferences.getInstance();
                // preferences.getKeys();
                // for(String key in preferences.getKeys()) {
                //   if(key != "email" && key!= "password") {
                //     preferences.remove(key);
                //   }
                // }
              },
            ),
          ],
        ),
      ),
      body :  ListView.builder(
          itemCount: usernamelist.length, // the length
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Image.asset('assets/iconfinder_books_514941.png'),
                        title: Text(usernamelist[index]),
                        // subtitle: Text('5/20 remaining'),
                        onTap: () {
                          // editbooknamestr = '';
                          // editbooknamestr = Categoryname[index];
                          // _showDialog();
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

