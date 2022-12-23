import 'package:flutter/material.dart';
import 'package:myapp/pages/SideNavBarPage.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/models/palette.dart';

class HomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  Widget _textformField() {
    return Padding(
      padding: EdgeInsets.only(top:10.0, bottom:10.0, right: 20.0),
      child: TextFormField(
        style: TextStyle(
            fontFamily: "DMSans",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Palette.white
        ),
        decoration: InputDecoration(
            fillColor: Palette.black,
            filled: true,
            hintText: "Search...",
            hintStyle: TextStyle(
                fontFamily: "DMSans",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Palette.white
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                size: 32,
                color: Palette.white,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  Widget _allCategories({required String image, required String name, required String description, required double price, required String deliveryFee, required String time, required String availability, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'index': 1,
          'image': image,
          'name': name,
          'description': description,
          'deliveryFee': deliveryFee,
          'time': time,
          'availability': availability,
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(right: 10.0),
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          color: Palette.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                name,
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 15,
                  color: Palette.white[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomCategories({required String image, required String name, required String description, required double price, required String deliveryFee, required String time, required String availability, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'index': 1,
          'image': image,
          'name': name,
          'description': description,
          'deliveryFee': deliveryFee,
          'time': time,
          'availability': availability,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Palette.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 15,
                                color: Palette.white[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(

                            child: Text(
                              'RM ${price.toStringAsFixed(2)}',
                              softWrap: false,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 15,
                                color: Palette.white[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.black[700],
      drawer: SideNavBar(),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: "DMSans",
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Palette.black[700],
        // I don't know why
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(Icons.menu),
        //     color: Palette.yellow,
        //     onPressed: () {
        //       _scaffoldKey.currentState!.openDrawer();
        //     },
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    child: IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.only(right: 10),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      onPressed: () async {

                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Palette.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only( left: 20.0 ),
        child: ListView(
          children: [
            Container(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textformField(),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 22,
                            color: Palette.white[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Pak Atong Kafe",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 32,
                            color: Palette.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Your Favorites",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 24,
                      color: Palette.white[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _allCategories(
                            image: 'images/food/Ayam-Goreng.png',
                            name: 'Ayam Goreng',
                            description: 'Masakan ayam goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Ayam-Kari.png',
                            name: 'Ayam Kari',
                            description: 'Masakan ayam kari',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Ayam-Kunyit.png',
                            name: 'Ayam Kunyit',
                            description: 'Masakan ayam kunyit',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Not Available",
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Cendawan-Goreng.png',
                            name: 'Cendawan Goreng',
                            description: 'Masakan cendawan goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 23,
                      color: Palette.white[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 300,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        scrollDirection: Axis.vertical,
                        children: [
                          _bottomCategories(
                            image: 'images/food/Ayam-Goreng.png',
                            name: 'Ayam Goreng',
                            description: 'Masakan ayam goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kari.png',
                            name: 'Ayam Kari',
                            description: 'Masakan ayam kari',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kunyit.png',
                            name: 'Ayam Kunyit',
                            description: 'Masakan ayam kunyit',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Not Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Cendawan-Goreng.png',
                            name: 'Cendawan Goreng',
                            description: 'Masakan cendawan goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Daging-Kicap.png',
                            name: 'Daging Kicap',
                            description: 'Masakan daging kicap',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Kuey-Teow.png',
                            name: 'Kuey Teow',
                            description: 'Masakan kuey teow',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Mee-Goreng.png',
                            name: 'Mee Goreng',
                            description: 'Masakan mee goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Nasi-Goreng.png',
                            name: 'Nasi Goreng',
                            description: 'Masakan nasi goreng',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sambal-Goreng-Tempe.png',
                            name: 'Sambal Goreng Tempe',
                            description: 'Masakan sambal goreng tempe',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sayur-Taugeh.png',
                            name: 'Sayur Taugeh',
                            description: 'Masakan sayur taugeh',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Tom-Yam.png',
                            name: 'Tom Yam',
                            description: 'Masakan tom yam',
                            price: 2,
                            time: "5 min",
                            deliveryFee: "Free",
                            availability: "Available",
                            context: context,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}