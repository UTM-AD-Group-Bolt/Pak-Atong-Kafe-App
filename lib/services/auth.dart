import 'package:flutter/material.dart';
import 'package:myapp/models/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  Function() alertBoxError({required text, required BuildContext context}){
    return () {
      // set up the buttons
      Widget closeButton = SizedBox(
        width: double.infinity,
        height: 50.0,
        child: TextButton(
            child: Text("Close"),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              foregroundColor: Palette.orange,
              backgroundColor: Palette.beige[300],
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            }
        ),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        icon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(
            Icons.warning_amber_rounded,
            color: Palette.brown,
            size: 60.0,
          ),
        ),
        insetPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Palette.beige[100],
        title: Text(text),
        titleTextStyle: TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Palette.brown,
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              closeButton,
            ],
          ),
        ),
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    };
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  MyUser? _userFromCredUser(User? user) {
    if (user != null) return MyUser(isAnon: true, uid: user.uid, firstname: "N/A", lastname: "", email: "Loading...");
    return null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().asyncMap(_userFromCredUser);
  }

  // sign in anon
  Future signInAnon(BuildContext context) async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateMenuData(user!.uid, 'Placeholder', 0);
      await DatabaseService(uid: user!.uid).updateAccountData(true, user!.uid, "", "", "");

      return _userFromCredUser(user);
    } catch (e) {
      alertBoxError(text: e.toString().substring(e.toString().indexOf("]")+2), context: context).call();
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return _userFromCredUser(user);
    } catch(e) {
      alertBoxError(text: e.toString().substring(e.toString().indexOf("]")+2), context: context).call();
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String firstname, String lastname, String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateMenuData(user!.uid, 'Placeholder', 0);
      await DatabaseService(uid: user!.uid).updateAccountData(false, user!.uid, firstname, lastname, email);

      return _userFromCredUser(user);
    } catch(e) {
      alertBoxError(text: e.toString().substring(e.toString().indexOf("]")+2), context: context).call();
      return null;
    }
  }

  // sign out
  Future signOut(BuildContext context) async {
    try{
      return await _auth.signOut();
    } catch(e) {
      alertBoxError(text: e.toString().substring(e.toString().indexOf("]")+2), context: context).call();
      return null;
    }
  }
}