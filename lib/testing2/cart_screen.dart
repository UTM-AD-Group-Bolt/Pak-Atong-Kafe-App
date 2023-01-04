import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/testing2/widgets.dart';

class TestCartScreen extends StatelessWidget {
  const TestCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: SizedBox(
        height: 900,
        child: Column(
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}