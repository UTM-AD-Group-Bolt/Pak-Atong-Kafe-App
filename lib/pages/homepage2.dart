import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/grocery_item_tile.dart';
import 'package:myapp/models/cartmodel2.dart';
import 'package:myapp/pages/cartpage2.dart';
import 'package:myapp/models/palette.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class homepage2 extends StatefulWidget {
  const homepage2({super.key});



  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {

  final fb = FirebaseDatabase.instance;



  @override
  Widget build(BuildContext context) {

    var k = Random().nextInt(10000);
    final ref = fb.ref().child('foodsnew/$k');

    func1(index){
      Provider.of<cartmodel2>(context, listen: false).addItemToCart(index);
    }

    func2(value, index){
      ref.set({

        "Food": value.shopItems[index][0],
        "Price": value.shopItems[index][1],
        "FoodImage": value.shopItems[index][2],
      }).asStream();
    }

    func3() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => homepage2()));
    }

    // String foodName = value.shopItems[index][0];
    // double price = value.shopItems[index][1],
    // String image = value.shopItems[index][2],

    return Scaffold(
      backgroundColor: Palette.black[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Arked Angkasa',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed("/home");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(
                Icons.home,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return cartpage2();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),

          // good morning bro
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Pak Atong Kafe',
            style: TextStyle(
                color: Colors.white,
            ),
              ),
          ),

          const SizedBox(height: 4),

          // Let's order fresh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Lunch today",
              style: GoogleFonts.notoSerif(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 6),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 6),

          // categories -> horizontal listview


          // recent orders -> show last 3
          Expanded(
            child: Consumer<cartmodel2>(
              builder: (context, value, child) {

                return GridView.builder(

                  padding: const EdgeInsets.all(12),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () => [
                        func1(index),
                      // Provider.of<cartmodel2>(context, listen: false).addItemToCart(index),

                      // ref.set({
                      //
                      // "Food": value.shopItems[index][0],
                      // "Price": value.shopItems[index][1],
                      // "FoodImage": value.shopItems[index][2],
                      // }).asStream();
                        func2(value, index),
                    //   Navigator.pushReplacement(
                    // context, MaterialPageRoute(builder: (_) => homepage2()));
                        func3(),
                    ],


                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}