import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/carttest.dart;

class cartPageTest extends StatefulWidget {

  @override
  State<cartPageTest> createState() => _cartPageTestState();
}

class _cartPageTestState extends State<cartPageTest> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  List FoodProfilesList = [];

  String foodID = "";


  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
}




