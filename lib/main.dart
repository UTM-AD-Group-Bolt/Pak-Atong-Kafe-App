import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'MenuDetailsPage.dart';
import 'favoritePage.dart';
import 'favorite.dart';
import 'favorite_card.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}