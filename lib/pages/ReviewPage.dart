import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const MainScreen ({Key? key}) : super (key: key);

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
      content: Form(
          key: _formKey,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration (
              hintText: 'Write your review..',
              filled: true,
            ),
            maxLines: 5,
            maxLength: 4096,
            textInputAction: TextInputAction.done,
          )
      )
      actions: [
  TextButton (
  child: const Text ('Submit'),
  onPressed: () async {
  /**Firebase**/
  }
  )
  ]
  );
}