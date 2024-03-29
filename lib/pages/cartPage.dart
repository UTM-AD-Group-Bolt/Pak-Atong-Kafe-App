import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/cart_controller.dart';

class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  _cartPageState createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {

  Map initData(Map data) {
    if (data['quantity'] == null) data['quantity'] = 0;
    if (data['image'] == null) data['image'] = "images/broken_link.png";
    if (data['name'] == null) data['name'] = "N/A";
    if (data['description'] == null) data['description'] = "N/A";
    if (data['indexNo'] == null) data['indexNo'] = 0;
    if (data['deliveryFee'] == null) data['deliveryFee'] = "N/A";
    if (data['time'] == null) data['time'] = "N/A";
    if (data['availability'] == null) data['availability'] = "N/A";
    return data;
  }

  Map? data = {};

  // List<String> foodNames = [
  //   "Ayam Goreng",
  //   "Ayam Kari",
  //   "Ayam Kunyit",
  //   "Cendawan Goreng",
  //   "Daging Kicap",
  //   "Kuey Teow",
  //   "Mee Goreng",
  //   "Nasi Goreng",
  //   "Sambal Goreng Tempe",
  //   "Sayur Taugeh",
  //   "Tom Yam",
  // ];
  // List<String> foodImages = [
  //   "images/food/Ayam-Goreng.png",
  //   "images/food/Ayam-Kari.png",
  //   "images/food/Ayam-Kunyit.png",
  //   "images/food/Cendawan-Goreng.png",
  //   "images/food/Daging-Kicap.png",
  //   "images/food/Kuey-Teow.png",
  //   "images/food/Mee-Goreng.png",
  //   "images/food/Nasi-Goreng.png",
  //   "images/food/Sayur-Taugeh.png",
  //   "images/food/Sambal-Goreng-Tempe.png",
  //   "images/food/Tom-Yam.png",
  // ];
  // List<String> foodDescription = [
  //   "Diperbuat daripada ayam goreng",
  //   "Diperbuat daripada ayam kari",
  //   "Diperbuat daripada ayam kunyit",
  //   "Diperbuat daripada cendawan goreng",
  //   "Diperbuat daripada daging kicap",
  //   "Diperbuat daripada kuey teow",
  //   "Diperbuat daripada mee goreng",
  //   "Diperbuat daripada nasi goreng",
  //   "Diperbuat daripada sambal goreng tempe",
  //   "Diperbuat daripada sayur taugeh",
  //   "Diperbuat daripada tom yam",
  // ];
  // List<double> foodPrice = [
  //   6.00,
  //   1.50,
  //   5.50,
  //   4.00,
  //   3.50,
  //   2.50,
  //   7.00,
  //   4.50,
  //   3.50,
  //   3.00,
  //   1.50,
  // ];
  // List<int> foodQuantity = [
  //   2,
  //   3,
  //   1,
  //   2,
  //   1,
  //   1,
  //   2,
  //   1,
  //   2,
  //   1,
  //   2,
  // ];




  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<dynamic, dynamic>?;
    int mmm = data!['indexNo'];

    if (data == null)
      data = initData(new Map());
    else
      data = initData(data!);

    String foodName = data!['foodName'];
    String image = data!['image'];
    String description = data!['description'];
    double price = data!['price'];
    int indexNo = data!['indexNo'];
    int quantity = data!['quantity'];


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
                  itemCount: data!
                      .values
                      .where((element) => element = true)
                      .length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) =>
                      Card(
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
                                    // image: AssetImage(foodImages[index]),
                                    image: AssetImage(image),

                                    // image: AssetImage('images/food/Ayam-Goreng.png'),

                                    // image: NetworkImage(cartController
                                    //     .cartItems[index]["product"]["image"])
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [

                                      Text(
                                        foodName,
                                        // foodNames[mmm],

                                        // cartController.cartItems[index]["product"]
                                        //     ["title"],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          // foodDescription[mmm],
                                          description,
                                          // cartController.cartItems[index]["product"]
                                          //     ["description"],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        // "\RM ${foodPrice[index].toStringAsFixed(2)}",
                                        "\RM ${price.toStringAsFixed(2)}",

                                        // "\$${cartController.cartItems[index]["product"]["price"]}",
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
                                          int.parse(cartController
                                              .cartItems[mmm]["quantity"]) - 1;
                                        }
                                    ),
                                  ),
                                  Container(
                                    height: 32,
                                    width: 32,
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      // foodQuantity[mmm].toString(),
                                      quantity.toString(),

                                      // cartController.cartItems[index]
                                      //     ["quantity"]
                                      // .toString()
                                    ),
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
    String foodName = data!['foodName'];
    String image = data!['image'];
    String description = data!['description'];
    double price = data!['price'];
    int indexNo = data!['indexNo'];
    int quantity = data!['quantity'];

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
                        // "\RM ${(foodPrice[0]+foodPrice[1]+foodPrice[2]).toStringAsFixed(2)}",
                        "\RM ${(price).toStringAsFixed(2)}",
                        // "\$${cartController.subtotal}",
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
                  // "\RM ${(foodPrice[0]+foodPrice[1]+foodPrice[2]+2).toStringAsFixed(2)}",
                        "\RM ${(price+2).toStringAsFixed(2)}",

                        // "\$${cartController.subtotal+2}",
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
    String foodName = data!['foodName'];
    String image = data!['image'];
    String description = data!['description'];
    double price = data!['price'];
    int indexNo = data!['indexNo'];
    int quantity = data!['quantity'];

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
            onPressed: () {
              print(quantity);
            },
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
