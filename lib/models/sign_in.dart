import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'palette.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.beige,
      appBar: AppBar(
        backgroundColor: Palette.brown,
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () async {

            },
            child: Text("Continue as Guest"),
          ),
        ),
      ),
    );
  }
}
