import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:myapp/models/addorder.dart';

class FetchingDataPage extends StatefulWidget {
  @override
  _FetchingDataPageState createState() => _FetchingDataPageState();
}

class _FetchingDataPageState extends State<FetchingDataPage> {
  final fb = FirebaseDatabase.instance;
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();
  var l;
  var g;
  var k;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('ordersfoodpanda');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => addOrder(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          var v =
          snapshot.value.toString(); // {subtitle: webfun, title: subscribe}

          g = v.replaceAll(
              RegExp("{|}|subtitle: |title: "), ""); // webfun, subscribe
          g.trim();

          l = g.split(','); // [webfun,  subscribe}]

          return GestureDetector(
            onTap: () {
              setState(() {
                k = snapshot.key;
              });

              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: second,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'title',
                      ),
                    ),
                  ),
                  content: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: third,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'sub title',
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      color: Color.fromARGB(255, 0, 22, 145),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await upd();
                        Navigator.of(ctx).pop();
                      },
                      color: Color.fromARGB(255, 0, 22, 145),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    onPressed: () {
                      ref.child(snapshot.key!).remove();
                    },
                  ),
                  title: Text(
                    l[1],
                    // 'dd',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    l[0],
                    // 'dd',

                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  upd() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("orders/$k");

// Only update the name, leave the age and address!
    await ref1.update({
      "title": second.text,
      "subtitle": third.text,
    });
    second.clear();
    third.clear();
  }
}