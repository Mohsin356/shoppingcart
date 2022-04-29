import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingcart/controllers/cart_controller.dart';
import 'package:shoppingcart/controllers/shopping_controller.dart';
import 'package:shoppingcart/views/change_name.dart';

class Shopping extends StatelessWidget {
  Shopping({Key? key}) : super(key: key);
  final shoppingController =Get.put(ShoppingController());
  final cartController =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(
                  builder: ((controller){
                    return
                      ListView.builder( itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(12),
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
                                              '${controller.products[index].productName}',
                                              style: const TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                                '${controller.products[index].productDescription}'),
                                          ],
                                        ),
                                        Text('\$${controller.products[index].price}',
                                            style: const TextStyle(fontSize: 24)),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                          cartController.addToCart(
                                            controller.products[index]
                                          );
                                      },
                                      style: ElevatedButton.styleFrom(primary: Colors.blue,
                                      onPrimary: Colors.white),
                                      child: const Text('Add to Cart'),
                                    ),
                                    const SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                        cartController.removefromCart(controller.products[index]);
                                      },
                                      style: ElevatedButton.styleFrom(primary: Colors.red,
                                          onPrimary: Colors.white),
                                      child: const Text('Remove from Cart'),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          });
                  }),
                ),
              ),
              GetX<CartController>(
                  builder: ((controller){
                    return Text('Total Amount: \$ ${controller.totalPrice}',style:
                      const TextStyle(color: Colors.white,fontSize: 25),);
                  }),
              ),
              const SizedBox(height: 10,),
                GetX<ShoppingController>(
                  builder:((controller) {
                    return Center(
                  child:  Text(controller.products[0].productName.toString()),
                  );}
                ),),
              const SizedBox(height: 10,),
               ElevatedButton(
                child: const Text("Second Page"),
                onPressed: (){
                  Get.to(ProductName());
                },
              ),
              const SizedBox(height: 10,),

            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: (){},
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.add_shopping_cart_rounded,
            color: Colors.black,),
            label: GetX<CartController>(
                builder: ((controller){
                  return Text('${controller.itemsCount}',style: const TextStyle(color: Colors.black),);
                }),),

          ),
        ));
  }
}
