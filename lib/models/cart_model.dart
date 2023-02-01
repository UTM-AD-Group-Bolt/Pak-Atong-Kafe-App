class Cart {

  final String? foodName;
  final String? foodImage;
  final double? price;
  final int? quantity;

  Cart({

    required this.foodName,
    required this.foodImage,
    required this.price,
    required this.quantity
});

  Cart.fromMap(Map<dynamic, dynamic> res ) :
  foodName = res['foodName'],
  foodImage = res['foodImage'],
  price = res['price'],
  quantity = res['quantity'];

  Map<String, Object?> toMap(){
    return {
      'foodName' : foodName,
      'foodImage' : foodImage,
      'price' : price,
      'quantity' : quantity,
    };
  }
}