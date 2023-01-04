import 'package:flutter/material.dart';
import 'package:myapp/testing2/cart_controller.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final CartController2 controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${controller.total}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}