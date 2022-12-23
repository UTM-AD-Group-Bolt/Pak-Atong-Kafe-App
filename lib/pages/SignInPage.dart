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

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  // Bool validators
  bool emailValid = true;
  bool passwordValid = true;
  bool isPasswordHidden = true;

  List<SocialMedia> socmeds = [
    SocialMedia(
      name: 'Google',
      icon: 'images/socialMedia/google.png',
      login: () async {
        print("User logs into Google");
      },
    ),
    SocialMedia(
      name: 'Facebook',
      icon: 'images/socialMedia/facebook.png',
      login: () async {
        print("User logs into Facebook");
      },
    ),
    SocialMedia(
      name: 'Twitter',
      icon: 'images/socialMedia/twitter.png',
      login: () async {
        print("User logs into Twitter");
      },
    ),
    SocialMedia(
      name: 'Instagram',
      icon: 'images/socialMedia/instagram.png',
      login: () async {
        print("User logs into Instagram");
      },
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Palette.black,
                        boxShadow: [
                          BoxShadow(
                            color: emailValid ? Palette.beige : Colors.red,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Email Address',
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
                              color: emailValid ? Palette.beige : Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Palette.white,
                        ),
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
                            color: passwordValid ? Palette.beige : Colors.red,
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
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Feedback.forTap(context);
                              setState(() { isPasswordHidden = !isPasswordHidden; }); //Toggles between true/false
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                                color: Palette.beige,
                                size: 32.0,
                              ),
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
                              color: passwordValid ? Palette.beige : Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Palette.white,
                        ),
                        obscureText: isPasswordHidden,
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
                          setState((){ password = val; });
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()){
                                print("email: " + email + " | password: " + password);
                                dynamic result = await _auth.signInWithEmailAndPassword(email, password, context);
                              }
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
                              recognizer: TapGestureRecognizer()..onTap = () {
                                  // play tap sound
                                  Feedback.forTap(context);

                                  // set up the buttons
                                  Widget signUpButton = SizedBox(
                                    width: double.infinity,
                                    height: 50.0,
                                    child: TextButton(
                                      child: Text("Register"),
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
                                      onPressed:  () {
                                        Navigator.of(context, rootNavigator: true).pop('dialog');
                                        Navigator.pushNamed(context, '/register');
                                      },
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
                                          Navigator.of(context, rootNavigator: true).pop('dialog');
                                          dynamic result = await _auth.signInAnon(context);
                                          if (result == null) {
                                            print("Error signing in!");
                                          } else {
                                            print("User signed in succesfully! (Anonymous)");
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
                                          signUpButton,
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
                    )).toList(),
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