import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference menuCollection = FirebaseFirestore.instance.collection("menus");

  Future updateUserData(String userID, String menuName, int quantity) async {
    return await menuCollection.doc(uid).set({
      'userID': userID,
      'menuName': menuName,
      'quantity': quantity,


    });
  }
}