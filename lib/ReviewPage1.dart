import 'package:flutter/material.dart';

class ReviewPage1 extends StatefulWidget {
  @override
  _ReviewPage1State createState() => _ReviewPage1State();
}

class _ReviewPage1State extends State <ReviewPage1> {
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
