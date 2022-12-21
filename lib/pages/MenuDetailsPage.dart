import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';

import '../models/palette.dart';

class MenuDetailsPage extends StatefulWidget {
  @override
  State<MenuDetailsPage> createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  Map initData(Map data) {
    if (data['quantity'] == null) data['quantity'] = 0;
    if (data['image'] == null) data['image'] = "images/broken_link.png";
    if (data['name'] == null) data['name'] = "N/A";
    if (data['description'] == null) data['description'] = "N/A";
    if (data['deliveryFee'] == null) data['deliveryFee'] = "N/A";
    if (data['time'] == null) data['time'] = "N/A";
    if (data['availability'] == null) data['availability'] = "N/A";
    return data;
  }

  Map? data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    if (data == null)
      data = initData(new Map());
    else
      data = initData(data!);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontFamily: "DMSans",
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2b2b2b),
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.amber,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: Center(
              child: Row(
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff2b2b2b),
      body: Column(
        children: [
          SizedBox(
            height: 20,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 48.0,
                bottom: 0.0,
                left: 16.0,
                right: 32.0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              data!['image'],
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              height: 455.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4.0,
                    width: 28.0,
                    margin: EdgeInsets.only(bottom: 28.0),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  Text(
                    data!['name'],
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            size: 30,
                            color: Palette.yellow,
                          ),
                          Text(
                            data!['deliveryFee'],
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.more_time,
                            size: 30,
                            color: Palette.yellow,
                          ),
                          Text(
                            data!['time'],
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.check,
                            size: 30,
                            color: Palette.yellow,
                          ),
                          Text(
                            data!['availability'],
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 52.0),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    data!['description'],
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');


                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Palette.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2.0),
                          topRight: Radius.circular(2.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
