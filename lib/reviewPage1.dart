import 'package:flutter/material.dart';

class reviewPage1 extends StatefulWidget {
  @override
  _reviewPage1State createState() => _reviewPage1State();
}

class _reviewPage1State extends State <reviewPage1> {
  void show(){
    showDialog(
        context: context,
        builder: (context) {
          return RatingDialog(
              icon: FlutterLogo(
                size: 100,
              )
          );
        }
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text('Review'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
      body: Container (
        child: Center (
          child: ElevatedButton(
            child: Text (
              "Rate Your Food",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
            onPressed: show,
          ),
        ),
      ),
    );
  }
}