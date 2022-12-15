import 'package:flutter/material.dart';

class reviewPage extends StatelessWidget {
  const reviewPage ({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text('Review'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
    );
  }
}

@override
Widget build (BuildContext context) {
  return Scaffold(
      body: Column(
        children: [
          Form(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration (
                hintText: 'Write your review..',
                filled: true,
              ),
              maxLines: 5,
              maxLength: 4096,
              textInputAction: TextInputAction.done,
            ),
          ),

          TextButton (
            child: const Text ('Submit'),
            onPressed: () async {
              /**Firebase**/
            }
          )
        ]
      )
  );
}