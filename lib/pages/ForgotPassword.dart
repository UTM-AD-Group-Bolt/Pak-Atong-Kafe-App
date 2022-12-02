import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  static String id = 'forgot password';

  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email your Email',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.import_contacts_sharp,
                              color: Colors.white,
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )
                        )

                    ),
                  ],
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Send Email'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Sign In'),
                  onPressed: () {},
                )
            )
        ));
  }
}

