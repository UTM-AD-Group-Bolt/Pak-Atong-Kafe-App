import 'package:flutter/material.dart';
import 'package:myapp/models/palette.dart';
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
        foodImage: 'images/food/Ayam-Goreng.png'),
    Favorite(
        foodName: 'Ayam Kari',
        foodDesc: 'Kari ayam kegemaran ramai',
        foodImage: 'images/food/Ayam-Kari.png'),
    Favorite(
        foodName: 'Sayur Campur',
        foodDesc: 'Kombinasi tiga jenis sayur',
        foodImage: 'images/food/Sayur-Taugeh.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black[600],
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (){
            // play tap sound
            Feedback.forTap(context);

            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Palette.yellow,
          ),
        ),
        title: Text('Favorites'),
        centerTitle: true,
        backgroundColor: Palette.black[600],
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
