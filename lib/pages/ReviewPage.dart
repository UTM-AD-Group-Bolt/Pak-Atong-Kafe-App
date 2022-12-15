import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 4096,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration (
                hintText: 'Write your review..',
                filled: true,
              ),
            ),
          ),
          TextButton (
            child: const Text ('Submit'),
            onPressed: () async {
              /**Firebase**/
            },
          ),
        ],
      ),
    );
  }
}