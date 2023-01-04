import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String title;
  final double price;
  final String image;
  // final String description;
  // final int quantity;

  const Product({
    required this.title,
    required this.price,
    required this.image,
    // required this.description,
    // required this.quantity,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      title: snap['title'],
      price: snap['price'],
      image: snap['image'],
      // description: snap['description'],
      // quantity: snap['quantity'],
    );
    return product;
  }
}