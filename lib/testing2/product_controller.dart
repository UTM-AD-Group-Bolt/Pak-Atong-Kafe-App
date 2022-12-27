import 'package:myapp/testing2/product_model.dart';
import 'package:myapp/testing2/firestore_db.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Add a list of Product objects.
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}