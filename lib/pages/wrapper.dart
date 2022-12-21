
import 'package:myapp/pages/authenticate.dart';
import 'package:myapp/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/signInPage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print("<StreamProvider> User updated to: " + user.toString());

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}