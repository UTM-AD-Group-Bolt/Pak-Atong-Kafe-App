import 'package:flutter/material.dart';

import 'favorite.dart';


class FavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final Function() delete;

  FavoriteCard({required this.favorite, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xff3c3f40),
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(favorite.foodImage),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favorite.foodName,
                      style: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      favorite.foodDesc,
                      style: TextStyle(
                        fontFamily: "DMSans",
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all(Colors.pink),
                          ),
                          onPressed: delete,
                          label: Text(
                            'Unfavorite',
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          icon: Icon(
                            Icons.heart_broken,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 6.0),
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all(Colors.amber),
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/menudetails',arguments: {
                              'index': 1,
                              'image': favorite.foodImage,
                              'name': favorite.foodName,
                              'description': favorite.foodDesc,
                              'deliveryFee': 'Free',
                              'time': '5 min',
                              'availability': 'Available',
                            });
                          },
                          label: Text(
                            'Order Again',
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
