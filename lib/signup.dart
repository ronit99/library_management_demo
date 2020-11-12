import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';
import 'usercategory.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'adminpage.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register>
{
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  // SharedPreferences sharedPreferences;
  bool checkvalue;// initialized first time.
  bool _isvalid = false;
  // _onChanged() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     sharedPreferences.setBool("check", checkvalue);
  //     sharedPreferences.setString("username", emailcontroller.text);
  //     sharedPreferences.setString("password", passcontroller.text);
  //     sharedPreferences.setString("usertype", _selectedname.name);
  //     // sharedPreferences.commit();
  //     // getCredential();
  //   });
  // }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Politics> _namesparty = Politics.getCompanies();
  List<DropdownMenuItem<Politics>> _dropdownMenuParties;
  Politics _selectedname;
  @override
  void initState() {
    _dropdownMenuParties = buildDropdownMenuParties(_namesparty);
    super.initState();
  }
  //check is the income comes under <1000 after count
  List<DropdownMenuItem<Politics>> buildDropdownMenuParties(List companies) {
    List<DropdownMenuItem<Politics>> items = List();
    for (Politics name in companies) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Text(name.name),
        ),
      );
    }
    return items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body : Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 102, 40, 0),
                        child:  TextFormField( decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(),
                            hintText: 'Email or username'
                        ),
                          controller: emailcontroller,
                          autofocus: false,
                          obscureText: false,
                        ), // Example
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),

                        child:  TextFormField( decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(),
                            hintText: 'Password'

                        ),
                          controller: passcontroller,
                          autofocus: false,
                          obscureText: true,
                        ), // Example
                      ),
                      SizedBox(height: 25),
                      Center(
                        child: Container(
                          height: 50,
                          width :340,
                          padding: EdgeInsets.fromLTRB(20, 4, 30, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey),
                          ),
                          child:
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                                hint: Text('Select type...'),
                                icon: Icon(Icons.keyboard_arrow_down),
                                isExpanded: true,
                                value: _selectedname,
                                items: _dropdownMenuParties,
                                onChanged: (value) {
                                  setState(() {
                                    print(_selectedname);
                                    _selectedname = value;
                                    // print(value.toString());
                                    //genderController.text = _selectedItem.gender;
                                  });
                                }),
                          ),
                        ),
                      ),
                      Container(
                          height: 120,
                          color: Colors.transparent,
                          //margin: EdgeInsets.only(bottom: 0.0),
                          // alignment: Alignment.bottomCenter ,
                          padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 10.0,top: 29.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '  Sign Up',
                                style: TextStyle(fontSize: 25,
                                    fontWeight:FontWeight.bold,
                                    color: Color.fromRGBO(78, 84, 95, 1)
                                ),
                              ),
                              ButtonTheme(
                                minWidth:70,
                                height: 70,
                                child:RaisedButton(
                                  shape: CircleBorder(),
                                  textColor: Colors.white,
                                  color: Colors.white,
                                  child: Image.asset("assets/right_arrow_in_a_circle.png",width: 60,height: 60,),
                                  onPressed: () {
                                    if(emailcontroller.text.length>0 && passcontroller.text.length>0)
                                    {
                                      _isvalid = EmailValidator.validate(emailcontroller.text);
                                      if (_isvalid == true) {
                                        if(_selectedname.name == 'Admin')
                                        {
                                          // _onChanged();
                                          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => adminpage()));
                                        }
                                        else if(_selectedname.name == 'User'){
                                          // _onChanged();
                                          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => userdata()));
                                        }
                                        else
                                        {
                                          print('no user types');
                                        }
                                      }
                                      else
                                      {
                                        print('password incorrect or email is incorrect or selected type is empty');
                                      }
                                    }
                                    else
                                    {

                                    }
                                  },
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                      ),
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
// void showModelBottomSheet({BuildContext context, Container Function(BuildContext context) builder}) {}
}
