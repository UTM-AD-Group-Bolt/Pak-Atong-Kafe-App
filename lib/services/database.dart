import 'package:cloud_firestore/cloud_firestore.dart';
//
class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference accountCollection = FirebaseFirestore.instance.collection("account");
  Future updateAccountData(bool isAnon, String userID, String firstname, String lastname, String email) async {
    return await accountCollection.doc(uid).set({
      'isAnon': isAnon,
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    });
  }

  final CollectionReference menuCollection = FirebaseFirestore.instance.collection("menus");
  Future updateMenuData(String userID, String menuName, int quantity) async {
    return await menuCollection.doc(uid).set({
      'userID': userID,
      'menuName': menuName,
      'quantity': quantity,
    });
  }
}