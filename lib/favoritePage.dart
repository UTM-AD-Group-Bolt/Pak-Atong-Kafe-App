import 'package:flutter/material.dart';
import 'favorite.dart';
import 'favorite_card.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List<Favorite> favorites = [
    Favorite(
        foodName: 'Ayam Goreng',
        foodDesc: 'Ayam goreng rangup',
        foodImage: 'images/Ayam-Goreng.png'),
    Favorite(
        foodName: 'Ayam Kari',
        foodDesc: 'Kari ayam kegemaran ramai',
        foodImage: 'images/Ayam-Kari.png'),
    Favorite(
        foodName: 'Sayur Campur',
        foodDesc: 'Kombinasi tiga jenis sayur',
        foodImage: 'images/Sayur-Taugeh.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.amber,
        ),
        title: Text('Favorites'),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
      ),
      body: Column(
        children: favorites
            .map((favorite) => FavoriteCard(
                favorite: favorite,
                delete: () {
                  setState(() {
                    favorites.remove(favorite);
                  });
                }))
            .toList(),
      ),
    );
  }
}