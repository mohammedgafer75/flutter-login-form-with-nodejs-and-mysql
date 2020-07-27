import 'package:flutter/material.dart';
import 'package:flutter_json_app/home.dart';
import 'package:flutter_json_app/http.dart';
import 'package:flutter_json_app/reg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String response;
  int check;
  Future<void> get_login() async {
    var result = await login('api/authenticate', {
      "name": name.text,
      "password": password.text,
    });

    if (result.ok) {
      setState(() {
        check = result.data['status'];
        if (check == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
          }));
        }
        if (check == 2) {
          response = result.data['message'];
        }
        if (check == 3) {
          response = result.data['message'];
        }
      });
    }
  }

  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Your_Home"),
          centerTitle: true,
        ),
        body: Builder(
            builder: (context) => Form(
                  key: _formKey,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: new Border.all(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView(
                        children: <Widget>[
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "Name",
                              icon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "please enter your name";
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "please enter your password";
                              }

                              return null;
                            },
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.blueAccent,
                                    padding: EdgeInsets.all(1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    colorBrightness: Brightness.light,
                                    onPressed: () {
                                      setState(() {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            get_login();
                                          });
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  RaisedButton(
                                    color: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    colorBrightness: Brightness.light,
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Reg();
                                      }));
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Text(response,
                                      style: TextStyle(color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
