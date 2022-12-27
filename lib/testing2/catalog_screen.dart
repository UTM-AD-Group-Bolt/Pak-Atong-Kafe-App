import 'package:flutter/material.dart';
import 'package:myapp/testing2/cart_screen.dart';
import 'package:get/get.dart';
import 'package:myapp/testing2/widgets.dart';

class TestCatalogScreen extends StatelessWidget {
  const TestCatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),
            ElevatedButton(
              onPressed: () => Get.to(() => TestCartScreen()),
              child: Text('Go to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}