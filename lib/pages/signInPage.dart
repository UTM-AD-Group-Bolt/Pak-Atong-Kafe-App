import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26201d),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff26201d),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffd8ae8b),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Email or Phone Number',
                    contentPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                    hintStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16.0,
                        color: Color(0xaafaf5d8),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xfff2ab37),
                        width: 4.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xffd8ae8b),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xfffaf5d8),
                  ),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff26201d),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffd8ae8b),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                    hintStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16.0,
                        color: Color(0xaafaf5d8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xfff2ab37),
                        width: 4.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xffd8ae8b),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xfffaf5d8),
                  ),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                  begin: Alignment(-0.95, 0.0),
                  end: Alignment(1.0, 0.0),
                  colors: [Color(0xffcd5f2a), Color(0xfff2ab37)],
                  stops: [0.0, 1.0],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x00ff0000),
                    elevation: 0.0,
                    shadowColor: Color(0x00ff0000),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      color: Color(0xfffaf5d8),
                    ),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}