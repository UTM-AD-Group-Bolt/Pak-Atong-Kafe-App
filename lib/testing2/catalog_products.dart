import 'package:flutter/material.dart';
import 'package:myapp/testing2/product_controller.dart';
import 'package:get/get.dart';

import 'package:myapp/testing2/cart_controller.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());

  CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Flexible(
        child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProductCard(index: index);
            }),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController2());
  final ProductController productController = Get.find();
  final int index;

  CatalogProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              productController.products[index].image,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              productController.products[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Text('${productController.products[index].price}'),
          ),
          IconButton(
            onPressed: () {
              cartController.addProduct(productController.products[index]);
            },
            icon: Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
    );
  }
}