import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget textformField(){
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Color(0xff3a3e3e),
          filled: true,
          hintText: "Search Food",
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search,color: Colors.white,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,

          )

        ),

      ),)
  }

  Widget _allCategories(){
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
              borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          Text(title,style: TextStyle(fontSize: 18, color: Colors.white),)
        ],
      )
    )
  }

  Widget _bottomCategories(){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3c3f40),
        borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        elevation: 0, 0,
        backgroundColor: Color(0xff2b2b2b),
        leading: Icon(Icons.sort, size: 30,),
        actions: [
          Padding(padding: EdgeInsets.all(9.0),
            child: Center(child: Container(
              child: CircleAvatar(
                maxRadius: 20,
                backgroundImage: AssetImage('images/profileicon.jpg'),
              ),
            ),
            ),
          )
        ],
      )
      body: Container(
    margin: EdgeInsets.only(left: 14,),
    child: ListView(

    children: [
    Container(
    height: 820,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    padding: EdgeInsets.only(top: 10),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Enjoy Your Meal With",
    style: TextStyle(
    fontSize: 18,
    color: Colors.white54,
    ),
    ),

    SizedBox(
    height: 4,
    ),
    Text(
    "Your Favourite Food",
    style: TextStyle(
    fontSize: 23,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    ]
    ),
    ],
    textformField(),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [

      _allCategories(
    image: 'images/393546 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/3911100_6d2d1938-ae16-4e28-8828-18446210ed33_682_682 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/cendawang celup tepung 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/D1Xnva-UYAEwqCb-1 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/Daging-masak-kicap 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/Local_Street_Style_(4857314400) 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/maxresdefault (1) 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/maxresdefault (2) 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/P1000151-2 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'images/photo 1.png',
    title: 'All'
    ),

    _allCategories(
    image: 'profileicon.jpg',
    title: 'All'
    ),

    _allCategories(
    image: 'Resepi-Sambal-Goreng-Tempe 1.png',
    title: 'All'
    ),

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
    children: [],


    ),
    ),

    ],
    ),
    ),
    );
  }
}