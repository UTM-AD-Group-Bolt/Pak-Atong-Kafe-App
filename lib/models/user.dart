import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  bool? isAnon;
  String? uid;
  String? firstname;
  String? lastname;
  String? email;

  MyUser({this.isAnon, this.uid, this.firstname, this.lastname, this.email});

  String toString(){
    if (isAnon!){
      return "IsAnon: " + isAnon.toString() + " | UID: " + uid.toString();
    }
    return "IsAnon: " + isAnon.toString() + " | UID: " + uid.toString() + " | Name: " + firstname.toString() + " " + lastname.toString() + " | Email: " + email.toString();
  }

  Future<MyUser> fromFirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    MyUser? myuser = MyUser(isAnon: true, uid: user!.uid, firstname: "N/A", lastname: "", email: "Loading...");

    final doc = await FirebaseFirestore.instance.collection('account').doc(user!.uid).get();
    if(doc.exists){
      myuser.isAnon = doc.data()!['isAnon'];
      myuser.firstname = doc.data()!['firstname'];
      myuser.lastname = doc.data()!['lastname'];
      myuser.email = doc.data()!['email'];
    }

    return myuser;
  }
}
