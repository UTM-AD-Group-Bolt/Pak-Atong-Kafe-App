import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _textformField() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
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

  Widget _allCategories({required String image, required String title}) {
    return Container(
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomCategories(
      {required String image, required String title, required double price}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3c3f40),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 60,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ $price',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff2b2b2b),
        leading: Icon(
          Icons.sort,
          size: 30,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: Center(
              child: Container(
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: AssetImage('images/profileicon.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 14,
        ),
        child: ListView(
          children: [
            Container(
              height: 820,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pak Atong Kafe",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Favourites",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _textformField(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _allCategories(
                            image: 'images/Ayam-Goreng.png',
                            title: 'Ayam Goreng'),
                        _allCategories(
                            image: 'images/Ayam-Kari.png', title: 'Ayam Kari'),
                        _allCategories(
                            image: 'images/Ayam-Kunyit.png',
                            title: 'Ayam Kunyit'),
                        _allCategories(
                            image: 'images/Cendawan-Goreng.png',
                            title: 'Cendawan Goreng'),
                      ],
                    ),
                  ),
                  Container(
                    height: 490,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 30,
                      scrollDirection: Axis.horizontal,
                      children: [
                        _bottomCategories(
                          image: 'images/Ayam-Goreng.png',
                          title: 'Ayam Goreng',
                          price: 2,
                        ),
                        _bottomCategories(
                          image: 'images/Ayam-Kari.png',
                          title: 'Ayam Kari',
                          price: 2,
                        ),
                        _bottomCategories(
                          image: 'images/Ayam-Kunyit.png',
                          title: 'Ayam Kunyit',
                          price: 2,
                        ),
                        _bottomCategories(
                          image: 'images/Cendawan-Goreng.png',
                          title: 'Cendawan Goreng',
                          price: 2,
                        ),
                        _bottomCategories(
                          image: 'images/Cendawan-Goreng.png',
                          title: 'Cendawan Goreng',
                          price: 2,
                        ),
                        _bottomCategories(
                          image: 'images/Cendawan-Goreng.png',
                          title: 'Cendawan Goreng',
                          price: 2,
                        ),
                      ],
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
