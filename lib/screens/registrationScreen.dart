import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './loginScreen.dart';
import './mainScreen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 15.0),
              Text(
                "Register here",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 2.0),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 2.0),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 2.0),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 2.0),
                    TextField(
                      controller: confirmPasswordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                        color: Colors.purpleAccent,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () {
                          if (nameTextEditingController.text.length < 3) {
                            displayTextMessage(
                                "Name must be at least 3 characters!", context);
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            displayTextMessage(
                                "E-mail address is not valid!", context);
                          } else if (phoneTextEditingController.text.isEmpty) {
                            displayTextMessage(
                                "Phone number is necessary", context);
                          } else if (passwordTextEditingController.text.length <
                              6) {
                            displayTextMessage(
                                "Password must be at least 6 characters",
                                context);
                          } else if (confirmPasswordTextEditingController
                                      .text.length <
                                  6 &&
                              confirmPasswordTextEditingController !=
                                  passwordTextEditingController) {
                            displayTextMessage(
                                "Password is not valid", context);
                          } else {
                            Navigator.pushNamed(context, MainScreen.idScreen);
                            // must have a login screen for hair-cut app
                          }
                        }),
                    SizedBox(height: 10.0),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.idScreen);
                      },
                      child: Text("Already have an Account?Login Here."),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

displayTextMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
