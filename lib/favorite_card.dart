import 'package:flutter/material.dart';
import 'favorite.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(favorite.foodImage),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          minWidth: 40,
                          height: 40,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          color: Color(0x000000ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        // child: TextButton.icon(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //     MaterialStateProperty.all(Colors.red[200]),
                        //   ),
                        //   onPressed: delete,
                        //   label: Text(''),
                        //   icon: Icon(Icons.heart_broken),
                        // ),
                        MaterialButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          minWidth: 40,
                          height: 40,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xfff2ab37),
                          ),
                          color: Color(0x000000ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        // child: TextButton.icon(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //     MaterialStateProperty.all(Colors.red[200]),
                        //   ),
                        //   onPressed: delete,
                        //   label: Text(''),
                        //   icon: Icon(Icons.heart_broken),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    width: 100,
                    child: Text(
                      favorite.foodName,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 20),
                    width: 180,
                    color: Color(0xff0000ff),
                    child: Text(
                      favorite.foodDesc,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
