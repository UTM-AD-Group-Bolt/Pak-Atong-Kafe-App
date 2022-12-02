import 'package:myapp/models/social_media.dart';
import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../models/social_media_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  List<SocialMedia> socmeds = [
    SocialMedia(
        name: 'Google',
        icon: 'images/socialMedia/google.png',
    ),
    SocialMedia(
        name: 'Facebook',
        icon: 'images/socialMedia/facebook.png',
    ),
    SocialMedia(
        name: 'Twitter',
        icon: 'images/socialMedia/twitter.png',
    ),
    SocialMedia(
        name: 'Instagram',
        icon: 'images/socialMedia/instagram.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff26201d),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 35.0),
              Image.asset(
                "images/title.png",
                width: double.infinity,
              ),
              SizedBox(height: 35.0),
              Column(
                children: [
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
                              return Color(0x0000ff00);
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
                              color: Color(0xfffaf5d8),
                            ),
                          ),
                          onPressed: () async {
                            print("email: " + email + " | password: " + password);
                          },
                        ),
                      )
                  ),
                  SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.0,
                            color: Color(0xfffaf5d8),
                          ),
                        ),
                        TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'DMSans',
                              fontSize: 16.0,
                              color: Color(0xfff2ab37),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('User moved to sign up page');
                              }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00ff0000),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xaad8ae8b),
                              blurRadius: 5.0,
                              spreadRadius: 1.5,
                            )
                          ],
                        ),
                        child: Divider(
                          height: 1.0,
                          thickness: 2.0,
                          color: Color(0xffd8ae8b),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Color(0xff26201d),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffd8ae8b),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xffd8ae8b),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xff26201d),
                          child: Center(
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 20.0,
                                color: Color(0xaafaf5d8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00ff0000),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xaad8ae8b),
                              blurRadius: 5.0,
                              spreadRadius: 1.5,
                            )
                          ],
                        ),
                        child: Divider(
                          height: 1.0,
                          thickness: 2.0,
                          color: Color(0xffd8ae8b),
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: socmeds.map((socmed) => SocMedButton(
                    socmed: socmed,
                    handler: () {
                      if (socmed.name == "Google") print("User logs into Google");
                      else if (socmed.name == "Facebook") print("User logs into Facebook");
                      else if (socmed.name == "Twitter") print("User logs into Twitter");
                      else if (socmed.name == "Instagram") print("User logs into Instagram");
                    }))
                    .toList(),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Copyright | Bolt (2022)",
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12.0,
                  color: Color(0xfffaf5d8),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}