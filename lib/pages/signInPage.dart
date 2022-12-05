import 'package:myapp/models/palette.dart';
import 'package:myapp/models/social_media.dart';
import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/models/social_media_button.dart';


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
      backgroundColor: Palette.black,
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
                      color: Palette.black,
                      boxShadow: [
                        BoxShadow(
                          color: Palette.beige,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Email or Phone Number',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: Palette.beige,
                            size: 32.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                        hintStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.0,
                          color: Color(0xaafaf5d8),
                        ),
                        fillColor: Colors.white,
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
                            color: Palette.beige,
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Palette.white,
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
                      color: Palette.black,
                      boxShadow: [
                        BoxShadow(
                          color: Palette.beige,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.key,
                            color: Palette.beige,
                            size: 32.0,
                          ),
                        ),
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
                            color: Palette.beige,
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Palette.white,
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
                            print("email: " + email + " | password: " + password);
                          },
                        ),
                      )
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 20.0,
                            color: Palette.white,
                          ),
                        ),
                        TextSpan(
                            text: 'Click here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'DMSans',
                              fontSize: 20.0,
                              color: Palette.yellow,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // set up the buttons
                                Widget cancelButton = SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: TextButton(
                                    child: Text("Sign up"),
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
                                    onPressed:  () {},
                                  ),
                                );

                                Widget continueButton = SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: TextButton(
                                    child: Text("Continue as Guest"),
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
                                    onPressed:  () async {
                                      dynamic result = await _auth.signInAnon();
                                      if (result == null) {
                                        print("Error signing in!");
                                      } else {
                                        print("User signed in succesfully!");
                                        print(result);
                                      }
                                    }
                                  ),
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.person_add_alt_1,
                                      color: Palette.brown,
                                      size: 60.0,
                                    ),
                                  ),
                                  insetPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  backgroundColor: Palette.beige[100],
                                  title: Text("Select action..."),
                                  titleTextStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28,
                                    color: Palette.brown,
                                  ),
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    height: 120.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        cancelButton,
                                        continueButton,
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
                          color: Colors.transparent,
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
                          color: Palette.beige,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Palette.black,
                        boxShadow: [
                          BoxShadow(
                            color: Palette.beige,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Palette.beige,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Palette.black,
                          child: Center(
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.0,
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
                          color: Colors.transparent,
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
                          color: Palette.beige,
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 10.0),
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
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  "Copyright | Bolt (2022)",
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12.0,
                  color: Palette.white,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}