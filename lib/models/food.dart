class Food {
  Food(this.name, this.age);
  final String title;
  final String image;
  final String description;
  final double price;
  final int quantity;

  // named constructor
  Food.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        description = json['description'],
        price = json['price'],
        quantity = json['quantity'],
        age = json['age'];
  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

}