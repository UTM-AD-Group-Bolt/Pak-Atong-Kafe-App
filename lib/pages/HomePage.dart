import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';

class HomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  Widget _textformField() {
    return Padding(
      padding: EdgeInsets.only(top:10.0, bottom:10.0, right: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Color(0xff3a3e3e),
            filled: true,
            hintText: "Search Food",
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  Widget _allCategories({required String image, required String title, required String description, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'quantity': 0,
          'image': image,
          'name': title,
          'description': description,
          'deliveryFee': 'Free',
          'time': '5 min',
          'availability': 'Available',
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(right: 10.0),
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xff3c3f40),
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
                title,
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomCategories({required String image, required String title, required double price, required String description,  required BuildContext context}) {
    if (title == "") return new Container(); //Ros: Returns an empty container if there are no titles
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'quantity': 0,
          'image': image,
          'name': title,
          'description': description,
          'deliveryFee': 'Free',
          'time': '5 min',
          'availability': 'Available',
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3c3f40),
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
                              title,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 15,
                                color: Colors.white,
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
                                color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: "DMSans",
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff2b2b2b),
        leading: Icon(
          Icons.sort,
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
                      onPressed: () async {
                        Navigator.pushNamed(context, '/faq');
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
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pak Atong Kafe",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _textformField(),
                  Text(
                    "Your Favorites",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _allCategories(
                          image: 'images/food/Ayam-Goreng.png',
                          title: 'Ayam Goreng',
                            description: 'Diperbuat daripada ayam goreng',
                          context: context
                        ),
                        _allCategories(
                          image: 'images/food/Ayam-Kari.png',
                          title: 'Ayam Kari',
                            description: 'Diperbuat daripada ayam kari',
                          context: context
                        ),
                        _allCategories(
                          image: 'images/food/Ayam-Kunyit.png',
                          title: 'Ayam Kunyit',
                          description: 'Diperbuat daripada ayam kunyit',
                          context: context
                        ),
                        _allCategories(
                          image: 'images/food/Cendawan-Goreng.png',
                          title: 'Cendawan Goreng',
                            description: 'Diperbuat daripada cendawan goreng',
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
                      color: Colors.white,
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
                            title: 'Ayam Goreng',
                            price: 2,
                            description: 'Diperbuat daripada ayam goreng',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kari.png',
                            title: 'Ayam Kari',
                            price: 2,
                            description: 'Diperbuat daripada ayam kari',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kunyit.png',
                            title: 'Ayam Kunyit',
                            price: 2,
                            description: 'Diperbuat daripada ayam kunyit',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Cendawan-Goreng.png',
                            title: 'Cendawan Goreng',
                            price: 2,
                            description: 'Diperbuat daripada cendawan goreng',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Daging-Kicap.png',
                            title: 'Daging Kicap',
                            price: 2,
                            description: 'Diperbuat daripada daging kicap',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Kuey-Teow.png',
                            title: 'Kuey Teow',
                            price: 2,
                            description: 'Diperbuat daripada kuey teow',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Mee-Goreng.png',
                            title: 'Mee Goreng',
                            price: 2,
                            description: 'Diperbuat daripada mee goreng',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Nasi-Goreng.png',
                            title: 'Nasi Goreng',
                            price: 2,
                            description: 'Diperbuat daripada nasi goreng',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sambal-Goreng-Tempe.png',
                            title: 'Sambal Goreng Tempe',
                            price: 2,
                            description: 'Diperbuat daripada sambal goreng tempe',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sayur-Taugeh.png',
                            title: 'Sayur Taugeh',
                            price: 2,
                            description: 'Diperbuat daripada sayur taugeh',
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Tom-Yam.png',
                            title: 'Tom Yam',
                            price: 2,
                            description: 'Diperbuat daripada tom yam',
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
