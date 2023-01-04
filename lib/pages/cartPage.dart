import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/cart_controller.dart';

class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  _cartPageState createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c3f40),
      appBar: _buildAppBar(),
      body: Obx(
        () {
          if (cartController.loading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (cartController.cartItems.isEmpty) {
            return Center(child: Text("No cart items found!"));
          }
          return Stack(
            children: [

              Container(),
              Positioned(
              bottom: 50,
              left: 0,
              right: 0,
                top: 220,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartController.cartItems.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) => Card(
                    elevation: 1,
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(8.0),
                      width: 100,
                      margin: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(cartController
                                      .cartItems[index]["product"]["image"])),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    cartController.cartItems[index]["product"]
                                        ["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cartController.cartItems[index]["product"]
                                          ["description"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "\$${cartController.cartItems[index]["product"]["price"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                color: Colors.grey[200],
                                child: IconButton(
                                  iconSize: 16.0,
                                    icon: Icon(Icons.remove),
                                        onPressed: () {
                                      int.parse(cartController.cartItems[index]["quantity"]) - 1;

          }
                                ),
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                padding: EdgeInsets.all(8.0),
                                child: Text(cartController.cartItems[index]
                                        ["quantity"]
                                    .toString()),
                              ),
                              Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ),

              ),
              _buildAbove(),
              _buildBottom(),
            ],
          );
        },
      ),
    );
  }

  _buildAbove() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 4.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,

        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${cartController.subtotal}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.grey
                        ),
                      ),

                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tax & Fees",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Not Applicable",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delivery",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "RM2.00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${cartController.subtotal+2}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),

                    ],
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  _buildBottom() {

    return Expanded(

      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15.0,
        ),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 128,
                vertical: 16.0,
              ),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            onPressed: () {},
            child: Text("Check out"),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff2b2b2b),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context,true);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.amber,
      ),

      title: Text(
        'Cart',
        style: TextStyle(
          fontFamily: "DMSans",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/favorites');
          },
          icon: Icon(Icons.favorite),
          color: Colors.pink,
        ),
      ],
    );
  }




}
