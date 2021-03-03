import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_task/widgets/txtfieldPassword.dart';
import './loginScreen.dart';
import './mainScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  FocusNode _phoneNumber, _email, _password, _retypePassword;

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    //intialize focus nodes.
    _phoneNumber = FocusNode();
    _email = FocusNode();
    _password = FocusNode();
    _retypePassword = FocusNode();
  }

  @override
  void dispose() {
    //destroy focus nodes objects.
    _phoneNumber.dispose();
    _email.dispose();
    _password.dispose();
    _retypePassword.dispose();
    super.dispose();
  }

// handle form submission.
  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
    } else {
      form.save();
    }
  }

// validate the name field by giving error if it's empty or doesn't match the regex which is alphapets only
  String _validateName(String value) {
    if (value.isEmpty) {
      return "Name is required";
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return "Please enter alphapets only";
    }
    return null;
  }

// validate the email field by giving error if it's empty or doesn't match the regex which is email format test@test.com
  String _validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }
    final nameExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!nameExp.hasMatch(value)) {
      return "Email is not valid";
    }
    return null;
  }

// validate the phone number field by giving error if it doesn't match the regex which is digits only
  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^^\d$');
    if (!phoneExp.hasMatch(value)) {
      return "Please enter digits only";
    }
    return null;
  }

// validate the name field by giving error if it's empty or doesn't match the repeated password field value
  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return "Password is required";
    }
    if (passwordField.value != value) {
      return "Password fields don't match";
    }
    return null;
  }

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
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autoValidateMode,
                  child: Column(
                    children: [
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                        onSaved: (value) {
                          _email.requestFocus();
                        },
                        validator: _validateName,
                      ),
                      SizedBox(height: 2.0),
                      TextFormField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _email,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                        onSaved: (value) {
                          _phoneNumber.requestFocus();
                        },
                        validator: _validateEmail,
                      ),
                      SizedBox(height: 2.0),
                      TextFormField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        focusNode: _phoneNumber,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                        onSaved: (value) {
                          _password.requestFocus();
                        },
                        validator: _validatePhoneNumber,
                      ),
                      SizedBox(height: 2.0),
                      PasswordField(
                        textInputAction: TextInputAction.next,
                        focusNode: _password,
                        fieldKey: _passwordFieldKey,
                        labelText: "Password",
                        controller: passwordTextEditingController,
                        onFieldSubmitted: (value) {
                          setState(() {
                            _retypePassword.requestFocus();
                          });
                        },
                      ),
                      /* TextField(
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
                      ), */
                      SizedBox(height: 2.0),
                      TextFormField(
                        controller: confirmPasswordTextEditingController,
                        focusNode: _retypePassword,
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
                        maxLength: 8,
                        validator: _validatePassword,
                        onFieldSubmitted: (value) {
                          _handleSubmitted();
                        },
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
                            _handleSubmitted();
                            displayTextMessage(
                                "Please solve errors in red above", context);
                            /* if (nameTextEditingController.text.length < 3) {
                              displayTextMessage(
                                  "Name must be at least 3 characters!",
                                  context);
                            } else if (!emailTextEditingController.text
                                .contains("@")) {
                              displayTextMessage(
                                  "E-mail address is not valid!", context);
                            } else if (phoneTextEditingController
                                .text.isEmpty) {
                              displayTextMessage(
                                  "Phone number is necessary", context);
                            } else if (passwordTextEditingController
                                    .text.length <
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
                            } */
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
