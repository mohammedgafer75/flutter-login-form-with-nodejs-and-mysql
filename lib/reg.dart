import 'package:flutter/material.dart';
import 'package:flutter_json_app/http.dart';

class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String response = "";

  CreateUser() async {
    var result = await http_post("api/register", {
      "name": name.text,
      "password": password.text,
    });
    if (result.ok) {
      setState(() {
        response = result.data['message'];
      });
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
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
                                            CreateUser();
                                            show(context, response);
                                          });
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Sing_in",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Text(response),
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

  void show(BuildContext context, String msg) {
    var bar = SnackBar(
      content: Text(msg),
    );
    Scaffold.of(context).showSnackBar(bar);
  }
}
