import 'package:flutter/material.dart';
import '../models/favorite.dart';
import '../models/favorite_card.dart';
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
        children: favorites.map((favorite) => FavoriteCard(
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
