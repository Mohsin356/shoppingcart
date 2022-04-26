import 'package:get/state_manager.dart';
import 'package:shoppingcart/models/product.dart';

class CartController extends GetxController {
  List cartItems = <Product>[].obs;
  int get itemsCount=> cartItems.length;
  double get totalPrice=> cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product){
    cartItems.add(product);
  }
  removefromCart(Product product) {
    cartItems.remove(product);
  }
}
