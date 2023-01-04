import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/database.dart';

class FetchingDataPage extends StatefulWidget {
  @override
  _FetchingDataPageState createState() => _FetchingDataPageState();
}

class _FetchingDataPageState extends State<FetchingDataPage> {

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("Food");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,true);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.amber,
        ),
        title: Text('FecthingDataPageTest Zone'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
      body: Container(
        child: Text('hello world'),








      ),
    );
  }
}
