import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference foodsList =
  FirebaseFirestore.instance.collection('foods');

  Future<void> createUserData(
      String title, String image, String description, double price, int quantity, String uid ) async {
    return await foodsList
        .doc(uid)
        .set({
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'quantity': quantity

        });
  }

  Future updateUserList(String title, String image, String description, double price, int quantity, String uid) async {
    return await foodsList.doc(uid).update({
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'quantity': quantity
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await foodsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}