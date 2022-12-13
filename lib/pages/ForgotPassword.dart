import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  static String id = 'forgot password';

  BuildContext? get context => null;

  get visible => null;

  @override
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

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
                SizedBox(height: 10,
                  ),
                Visibility(
                  maintainSize: true,
                   maintainAnimation: true,
                   maintainState: true,
                    visible: visible,
                   child: Container(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                      ))),
            ],
        ),
    );
  }

  void Forgotpass(String email) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
        Navigator.of(context!).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()))
      })
          .catchError((e) {});
    }
  }

  








  


LoginPage() {
}