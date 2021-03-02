import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './mainScreen.dart';
import './registrationScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final facebookLogin = FacebookLogin();

  Future<GoogleSignInAccount> _handleSignIn() async {
    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      if (account.email != null) {
        return account;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 15.0),
              Text(
                "Login here",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
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
                    SizedBox(height: 15.0),
                    RaisedButton(
                        color: Colors.purpleAccent,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () {
                          if (emailTextEditingController.text.length < 3) {
                            displayTextMessage(
                                "Name must be at least 3 characters!", context);
                          } else if (passwordTextEditingController.text.length <
                              6) {
                            displayTextMessage(
                                "Password must be at least 6 characters",
                                context);
                          } else {
                            Navigator.pushNamed(context, MainScreen.idScreen);
                          }
                        }),
                    SizedBox(height: 10.0),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegistrationScreen.idScreen);
                      },
                      child: Text("Do not have an Account?Register here!"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        color: Colors.purpleAccent,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: const Text(
                              "Google Login",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () async {
                          var account = await _handleSignIn();
                          if (account != null) {
                            Navigator.pushReplacementNamed(
                                context, MainScreen.idScreen);
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        color: Colors.purpleAccent,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: const Text(
                              "Facebook Login",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () async {
                          final result = await facebookLogin.logIn(['email']);
                          switch (result.status) {
                            case FacebookLoginStatus.loggedIn:
                              print("logged in");
                              Navigator.pushReplacementNamed(
                                  context, MainScreen.idScreen);
                              break;
                            case FacebookLoginStatus.cancelledByUser:
                              print("canceled");
                              break;
                            case FacebookLoginStatus.error:
                              print("error");
                              break;
                          }
                        }),
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
