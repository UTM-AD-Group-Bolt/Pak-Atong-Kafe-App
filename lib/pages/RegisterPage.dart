import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';

import '../models/palette.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Widget _textField({required isEmpty, required String hintText, required IconData icon, required bool isPasswordField, bool? isConfirmPassword, required void Function(String?) onChanged}){
    bool _isPasswordHidden = true;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Palette.black,
        boxShadow: [
          BoxShadow(
            color: (isPasswordField) ? (isConfirmPassword! && !isPasswordMatch ? Colors.red : Palette.beige ) : (isEmpty ? Colors.red : Palette.beige),
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
              setState(() { (isConfirmPassword!) ? isPassword2Hidden = !isPassword2Hidden : isPasswordHidden = !isPasswordHidden; }); //Toggles between true/false
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                (isConfirmPassword!) ? (isPassword2Hidden ? Icons.visibility_off : Icons.visibility) : (isPasswordHidden ? Icons.visibility_off : Icons.visibility),
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
              color: (isPasswordField) ? (isConfirmPassword! && !isPasswordMatch ? Colors.red : Palette.beige ) : (isEmpty ? Colors.red : Palette.beige),
              width: 2.0,
            ),
          ),
        ),
        style: TextStyle(
          color: Palette.white,
        ),
        obscureText: (isPasswordField) ? (isConfirmPassword! ? isPassword2Hidden : isPasswordHidden) : false,
        onChanged: onChanged,
      ),
    );
  }

  final AuthService _auth = AuthService();

  // text field state
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  bool isPasswordHidden = true;
  bool isPassword2Hidden = true;
  bool isPasswordMatch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      appBar: AppBar(
        backgroundColor: Palette.black,
        elevation: 0.0,
        title: Text(
            'Sign up',
            style: TextStyle(
              color: Palette.white,
              fontFamily: "DMSans",
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              _textField(
                isEmpty: (firstname==""),
                hintText: "First Name",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                onChanged: (val) {
                  setState(() => firstname = val!);
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isEmpty: (lastname==""),
                hintText: "Last Name",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                onChanged: (val) {
                  setState(() => lastname = val!);
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isEmpty: (email==""),
                hintText: "Email or Phone Number",
                icon: Icons.account_circle_rounded,
                isPasswordField: false,
                onChanged: (val) {
                  setState(() => email = val!);
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isEmpty: (password==""),
                hintText: "Password",
                icon: Icons.key,
                isPasswordField: true,
                isConfirmPassword: false,
                onChanged: (val) {
                  setState(() => password = val!);
                },
              ),
              SizedBox(height: 20.0),
              _textField(
                isEmpty: (password==""),
                hintText: "Confirm Password",
                icon: Icons.key,
                isPasswordField: true,
                isConfirmPassword: true,
                onChanged: (val) {
                  setState(() => isPasswordMatch = (password == val));
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
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                          color: Palette.white,
                        ),
                      ),
                      onPressed: () {
                        print("name: " + firstname + " " + lastname +  " | email: " + email + " | password: " + password);
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}