import 'package:flutter/cupertino.dart';
import 'package:hinlapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserService _userService = UserService();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _comfirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "Male";
  bool hidePass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/products/wp3.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              alignment: Alignment.center,
              child: Form(
                  child: Column(
                key: _formKey,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _nameTextController,
                          decoration: InputDecoration(
                            hintText: "Full name",
                            icon: Icon(Icons.person_outline),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The name field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.alternate_email),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email is valid';
                              else
                                return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _passwordTextController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "The password has to be as least 6 characters long";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                hidePass = false;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _comfirmPasswordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "The password has to be as least 6 characters long";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                hidePass = false;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: new Container(
                      color: Colors.white.withOpacity(0.5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Male",
                                style: TextStyle(color: Colors.white70),
                              ),
                              trailing: Radio(
                                  value: "Male",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanges(e)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Female",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.white70),
                              ),
                              trailing: Radio(
                                  value: "Female",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanges(e)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red.withOpacity(0.8),
                      elevation: 0.0,
                      child: MaterialButton(
                          onPressed: () {
                            validateForm();
                            // handleSignIn();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Have a account? Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  valueChanges(e) {
    setState(() {
      if (e == "Male") {
        groupValue = e;
      } else if (e == "Female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future<void> validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
      }
    }
  }
}
