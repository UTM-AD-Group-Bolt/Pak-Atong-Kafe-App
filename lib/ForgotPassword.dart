import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends statelessWidget {

  static String id = 'forgot password';

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: ColorS.black,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email your Email',
                style: TextStyle(fontSize: 30, color.white),
              ),
              TextFormField(
                style: TextStyle(color: colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    icon.mail,
                    color: Colors.white,
                  ),
                    errorstyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle:  TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
            ],
          ),
        ),
    SizedBox(height: 20),
    RaisedButton(
    child: Text('Send Email')
    onPressed: () {},
      ),
    FlatButton(

    child: Text('Sign In'),
    onPressed: () {},
    )
  },
},