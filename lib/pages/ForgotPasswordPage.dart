import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/palette.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({key}) : super(key: key);

  State<ForgotPassword> createState() => _ForgotPasswordState();
}

extension Validator on String {
  bool isValidEmail() {
    return RegExp(r'^.+@[a-zA-Z-]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      ).then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

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
        obscureText: false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        elevation: 0,
      ), //appbar
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Please enter your email address for the password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height:10),
            Padding( //email text-field
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height:10),
            MaterialButton(
              onPressed: () {
                passwordReset();
              },
              child: Text('Reset Password'),
              color: Colors.amber[200],
            ),
          ],
        ),
      ),

    );

  }
}