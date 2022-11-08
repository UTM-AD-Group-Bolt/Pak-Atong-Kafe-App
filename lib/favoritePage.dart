import 'package:flutter/material.dart';
import 'favorite.dart';
import 'favorite_card.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {

  List<Favorite> favorites = [
    Favorite(foodName: 'Ayam Goreng', foodDesc: 'Ayam goreng rangup'),
    Favorite(foodName: 'Ayam Kari', foodDesc: 'Kari ayam kegemaran ramai'),
    Favorite(foodName: 'Sayur Campur', foodDesc: 'Kombinasi tiga jenis sayur')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
      body: Column(
        children: favorites.map((favorite) => FavoriteCard(
            favorite: favorite,
            delete: () {
              setState(() {
                favorites.remove(favorite);
              });
            }
        )).toList(),
      ),
    );
  }
}