import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/cartmodel2.dart';
import 'package:myapp/models/palette.dart';
import 'package:myapp/pages/PaymentSuccessPage.dart';

class cartpage2 extends StatelessWidget {
  const cartpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<cartmodel2>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Let's order fresh items for you
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36,
                            ),
                            title: Text(
                              value.cartItems[index][0],
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              '\RM ${double.parse(value.cartItems[index][1]).toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<cartmodel2>(context, listen: false)
                                      .removeItemFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            '\RM ${value.calculateTotal()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // pay now
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade200),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.pushNamed(context, '/paymentsuccess');
                            //Navigator.of(context, rootNavigator: true).pushNamed("/paymentsuccess");

                            // Navigator.pushNamed(context, '/paymentsuccess',arguments: {
                            //   'totalPrice': value.calculateTotal(),
                            // });

                            Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (_) => PaymentScreen(value: value)));
                          },
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}