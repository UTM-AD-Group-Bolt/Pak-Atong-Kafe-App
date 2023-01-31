import 'package:myapp/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/SignInPage.dart';
import 'package:myapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    dynamic user = Provider.of<MyUser?>(context);
    if (user == null) return SignInPage();

    if (user!.email == "Loading..."){
      AuthService().user.first.then((userObj){
        userObj!.fromFirebase()!.then((userData){
          setState(() {
            user!.isAnon = userData!.isAnon!;
            user!.firstname = userData!.firstname!;
            user!.lastname = userData!.lastname!;
            user!.email = userData!.email!;
            print("<StreamProvider> User data loaded from Firebase successfully!");
          });
        });
      });
    }
    print("<StreamProvider> Current user is => " + user.toString());

    return HomePage();
  }
}