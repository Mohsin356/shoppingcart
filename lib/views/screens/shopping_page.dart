import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingcart/controllers/cart_controller.dart';
import 'package:shoppingcart/controllers/shopping_controller.dart';
import 'package:shoppingcart/views/screens/change_name.dart';

class Shopping extends StatelessWidget {
  Shopping({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: shoppingController.products.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${shoppingController.products[index].productName}',
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${shoppingController.products[index].productDescription}'),
                                      ],
                                    ),
                                    Text(
                                        '\$${shoppingController.products[index].price}',
                                        style: const TextStyle(fontSize: 24)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController.addToCart(
                                        shoppingController.products[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.white),
                                  child: const Text('Add to Cart'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.to(ProductName());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        onPrimary: Colors.white),
                                    child: const Text('Update Product')),
                                const SizedBox(
                                  height: 10,
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                      cartController.removeFromCart(
                                          shoppingController.products[index]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        onPrimary: Colors.white),
                                    child: const Text('Remove from Cart'))
                              ])));
                })),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Obx((){
        return Text(
        'Total Amount: \$ ${cartController.totalPrice}',
        style: const TextStyle(color: Colors.white, fontSize: 25),
        );
        }),
        const SizedBox(
          height: 10,
        ),
    ]
    )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.blue,
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(
          builder: ((controller) {
            return Text(
              '${controller.itemsCount}',
              style: const TextStyle(color: Colors.black),
            );
          }),
        ),
      ),
    ));
  }
}
