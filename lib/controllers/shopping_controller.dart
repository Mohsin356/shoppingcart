import 'package:get/state_manager.dart';
import 'package:shoppingcart/models/product.dart';

class ShoppingController extends GetxController{
 List products=<Product>[].obs;

 @override
 void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

void fetchProduct()async{
   await Future.delayed(const Duration(seconds: 1));
   var response= [
     Product(
         id: 1,
         price: 30,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'FirstProd'),
     Product(
         id: 2,
         price: 40,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'SecProd'),
     Product(
         id: 3,
         price: 49.5,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'ThirdProd'),
   ];
   products= response;
}
}