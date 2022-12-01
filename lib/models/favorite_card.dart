import 'package:flutter/material.dart';
import '../favorite.dart';

class FavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final Function() delete;

  FavoriteCard({required this.favorite, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(


          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage(favorite.foodImage),
                  ),
                  Text(
                    favorite.foodName,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    favorite.foodDesc,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[800],
                    ),
                  ),

                ],
              ),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all(Colors.red[200]),
                        ),
                        onPressed: delete,
                        label: Text('Unfavorite'),
                        icon: Icon(Icons.heart_broken),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all(Colors.amber[300]),
                        ),
                        onPressed: delete,
                        label: Text('Order Again'),
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ),
                  )
                ],


              ),
            ],
          ),
        ));
  }
}
