
import 'package:myapp/services/auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        elevation: 0,
      ), //appbar
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
                'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)
          ),
        ),
          SizedBox(height:10),
          //email text-field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBordet(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillcolor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          SizedBox(height:10),

          MaterialButton(
            onPressed: () {},
            child: Text('Reset Password'),
            color: Colors.amber[200],
          ),
        ],
      ),

    );

  }
}