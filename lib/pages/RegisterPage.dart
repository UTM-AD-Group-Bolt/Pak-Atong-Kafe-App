import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';

import '../models/palette.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

extension Validator on String {
  bool isValidEmail() {
    return RegExp(r'^.+@[a-zA-Z-]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);
  }

  // bool isValidPhoneNo() {
  //   return RegExp(r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\W*\d\W*\d\W*\d\W*\d\W*\d\W*\d\W*\d\W*\d\W*(\d{1,2})$').hasMatch(this);
  // }

  String isValidPassword(){
    if (this == "") return "Password cannot be empty!";
    if (this.length < 8) return "Password must be at least 8 characters long";
    if (this.length > 12) return "Password must not be more than 12 characters long";
    if (!this.contains(RegExp(r'[A-Z]'))) return "Password must contain at least 1 uppercase character";
    if (!this.contains(RegExp(r'[a-z]'))) return "Password must contain at least 1 lowercase character";
    if (!this.contains(RegExp(r'[0-9]'))) return "Password must contain at least 1 digit";
    if (!this.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return "Password must contain at least 1 special character";

    return "";
  }
}

class _RegisterPageState extends State<RegisterPage> {
  Widget _textField({required isValid, required String hintText, required IconData icon, required bool isPasswordField, bool? isConfirmPassword, required void Function(String?) onChanged, required String? Function(String?) validator}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Palette.black,
        boxShadow: [
          BoxShadow(
            color: isValid ? Palette.beige : Colors.red,
            blurRadius: 5.0,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: TextFormField(
        decoration: new InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Icon(
              icon,
              color: Palette.beige,
              size: 32.0,
            ),
          ),
          suffixIcon: isPasswordField ? GestureDetector( //if (isPasswordField), then suffixIcon = GestureDetector()
            onTap: () {
              Feedback.forTap(context);
              setState(() { (isConfirmPassword) ? isConfirmPasswordHidden = !isConfirmPasswordHidden : isPasswordHidden = !isPasswordHidden; }); //Toggles between true/false
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                (isConfirmPassword!) ? (isConfirmPasswordHidden ? Icons.visibility_off : Icons.visibility) : (isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                color: Palette.beige,
                size: 32.0,
              ),
            ),
          )
          : null, //if (!isPasswordField), then suffixIcon = null
          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          hintStyle: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 16.0,
            color: Color(0xaafaf5d8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Palette.yellow,
              width: 4.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: isValid ? Palette.beige : Colors.red,
              width: 2.0,
            ),
          ),
        ),
        style: TextStyle(
          color: Palette.white,
        ),
        obscureText: (isPasswordField) ? (isConfirmPassword! ? isConfirmPasswordHidden : isPasswordHidden) : false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  Function() alertBoxSignUp({required text, required BuildContext context}){
    return () {
      // set up the buttons
      Widget closeButton = SizedBox(
        width: double.infinity,
        height: 50.0,
        child: TextButton(
            child: Text("Close"),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              foregroundColor: Palette.orange,
              backgroundColor: Palette.beige[300],
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            }
        ),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        icon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(
            Icons.warning_amber_rounded,
            color: Palette.brown,
            size: 60.0,
          ),
        ),
        insetPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Palette.beige[100],
        title: Text(text),
        titleTextStyle: TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Palette.brown,
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              closeButton,
            ],
          ),
        ),
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    };
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text field states
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';

  // Bool validators
  bool firstnameValid = true;
  bool lastnameValid = true;
  bool emailValid = true;
  bool passwordValid = true;
  bool isPasswordMatch = true;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      appBar: AppBar(
        backgroundColor: Palette.black,
        elevation: 0.0,
        title: Text(
            'Register',
            style: TextStyle(
              color: Palette.white,
              fontFamily: "DMSans",
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              _textField(
                isValid: firstnameValid,
                hintText: "First Name",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                validator: (val) {
                  if (val==""){
                    setState((){ firstnameValid = false; });
                    return "Please enter a first name";
                  }

                  setState((){ firstnameValid = true; });
                  return null;
                },
                onChanged: (val) {
                  setState((){ firstname = val!; });
                  _formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isValid: lastnameValid,
                hintText: "Last Name",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                validator: (val) {
                  if (val==""){
                    setState((){ lastnameValid = false; });
                    return "Please enter a last name";
                  }

                  setState((){ lastnameValid = true; });
                  return null;
                },
                onChanged: (val) {
                  setState(() => lastname = val!);
                  _formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isValid: emailValid,
                hintText: "Email Address",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                validator: (val) {
                  if (val==""){
                    setState((){ emailValid = false; });
                    return "Please enter an email address";
                  } else if (!val!.isValidEmail()) { //if not a valid email address
                    setState((){ emailValid = false; });
                    return "Please enter a valid email address";
                  }

                  setState((){ emailValid = true; });
                  return null;
                },
                onChanged: (val) {
                  setState(() => email = val!);
                  _formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isValid: passwordValid,
                hintText: "Password",
                icon: Icons.key,
                isPasswordField: true,
                isConfirmPassword: false,
                validator: (val) {
                  if (val==""){
                    setState((){ passwordValid = false; });
                    return "Please enter a password";
                  } else if (password.isValidPassword()!=""){
                    setState((){ passwordValid = false; });
                    return password.isValidPassword();
                  }

                  setState((){ passwordValid = true; });
                  return null;
                },
                onChanged: (val) {
                  setState((){
                    password = val!;
                    isPasswordMatch = (password == val!);
                  });
                  _formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isValid: isPasswordMatch,
                hintText: "Confirm Password",
                icon: Icons.key,
                isPasswordField: true,
                isConfirmPassword: true,
                validator: (val) {
                  if (!isPasswordMatch){
                    return "The password does not match";
                  } else if (val==""){
                    return "Please enter the same password again";
                  }

                  return null;
                },
                onChanged: (val) {
                  setState((){ isPasswordMatch = (password == val!); });
                  _formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    begin: Alignment(-0.95, 0.0),
                    end: Alignment(1.0, 0.0),
                    colors: [Palette.orange, Palette.yellow],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: SizedBox(
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.transparent;
                      }),
                      elevation: MaterialStateProperty.resolveWith((states) {
                        return 0.0;
                      }),
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed) ? Color(0xaacd5f2a) : null;
                      }),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: Palette.white,
                      ),
                    ),
                    onPressed: () async {
                      if(firstname==""){ alertBoxSignUp(text: 'First Name cannot be empty!', context: context).call(); return; }
                      if(lastname==""){ alertBoxSignUp(text: 'Last Name cannot be empty!', context: context).call(); return; }
                      if(email==""){ alertBoxSignUp(text: 'Email Address cannot be empty!', context: context).call(); return; }
                      if(!emailValid){ alertBoxSignUp(text: 'Email Address is not valid!', context: context).call(); return; }
                      String reason = password.isValidPassword();
                      if(reason!=""){ alertBoxSignUp(text: reason, context: context).call(); return; }
                      if(!isPasswordMatch){ alertBoxSignUp(text: 'Password does not match!', context: context).call(); return; }

                      print("name: " + firstname + " " + lastname +  " | email: " + email + " | password: " + password);
                      dynamic result = await _auth.registerWithEmailAndPassword(firstname, lastname, email, password, context);
                      if (result != null) Navigator.pop(context);
                    },
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