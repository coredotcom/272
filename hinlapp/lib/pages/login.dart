import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hinlapp/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinlapp/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool hidePass = true;
  SharedPreferences preferences;
  bool loading;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    // preferences = await SharedPreferences.getInstance();
    // isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result = await firebaseAuth.signInWithCredential(credential);
    final firebaseUser = result.user;
    if ((FirebaseUser) != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("user")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance
            .collection("user")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("id", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoUrl);
      } else {
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoUrl);
      }
      Fluttertoast.showToast(msg: "login was successful");
      setState(() {
        loading = true;
      });
    } else {}
  }

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
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
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
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(  Icons.alternate_email),
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
                      color: Colors.red.withOpacity(0.8),
                      elevation: 0.0,
                      child: MaterialButton(
                          onPressed: () {
                            handleSignIn();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Login",
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
                      child: Text("Forgot password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Already account? Sign up",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.white,
                  // ),
                  // Text("Other login in option",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 20.0)),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     color: Colors.red,
                  //     elevation: 0.0,
                  //     child: MaterialButton(
                  //         onPressed: () {
                  //           handleSignIn();
                  //         },
                  //         minWidth: MediaQuery.of(context).size.width,
                  //         child: Text(
                  //           "Google",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20.0),
                  //         )),
                  //   ),
                  // )
                  // TextFormField(
                  //   decoration:
                  //       InputDecoration(labelText: "Email *"),
                  //   keyboardType: TextInputType.emailAddress,
                  //   controller: _emailTextController,
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       Pattern pattern =
                  //           r'^(([^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  //       RegExp regex = new RegExp(pattern);
                  //       if (!regex.hasMatch(value))
                  //         return 'Please make sure your email is valid';
                  //       else
                  //         return null;
                  //     }
                  //   },
                  // )
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
}
