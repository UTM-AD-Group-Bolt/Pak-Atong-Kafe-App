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
              _buildAbove(),
              Container(),
              Positioned(
              bottom: 0,
              left: 0,
              right: 0,
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
                                color: Colors.grey[200],
                                child: Icon(Icons.remove),
                              ),
                              Container(
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
              _buildBottom(),
            ],
          );
        },
      ),
    );
  }

  _buildAbove() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,

      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 4.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,

        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                        ),
                      ),
                      Text(
                        "Subtotal does not include shipping",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 56),
              Row(
                children: [


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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
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
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff2b2b2b),
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Menu',
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
