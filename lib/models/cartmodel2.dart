import 'package:flutter/material.dart';

class cartmodel2 with ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Ayam Goreng", "2.3", "images/food/Ayam-Goreng.png", Colors.brown],
    ["Ayam Kari", "2.4", "images/food/Ayam-Kari.png", Colors.brown],
    ["Ayam Kunyit", "2.5", "images/food/Ayam-Kunyit.png", Colors.brown],
    // ["Cendawan Goreng", "2.6", "images/food/Cendawan-Goreng.png", Colors.brown],
    // ["Daging Kicap", "2.7", "images/food/Daging-Kicap.png", Colors.brown],
    // ["Kuey Teow", "2.8", "images/food/Kuey-Teow.png", Colors.brown],
    // ["Mee Goreng", "2.9", "images/food/Mee-Goreng.png", Colors.brown],
    // ["Nasi Goreng", "3.0", "images/food/Nasi-Goreng.png", Colors.brown],
    // ["Sambal Goreng Tempe", "3.1", "images/food/Sambal-Goreng-Tempe.png", Colors.brown],
    // ["Sayur Taugeh", "3.2", "images/food/Sayur-Taugeh.png", Colors.brown],
    // ["Tom Yam", "3.3", "images/food/Tom-Yam.png", Colors.brown],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}