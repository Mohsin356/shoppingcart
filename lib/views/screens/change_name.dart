import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/controllers/shopping_controller.dart';

import 'package:shoppingcart/views/widgets/textField.dart';

class ProductName extends StatelessWidget {
  ProductName({Key? key}) : super(key: key);
  final controller = Get.find<ShoppingController>();
  var updatedName = TextEditingController();
  var  updatedDesc = TextEditingController();
  var updatedPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(title:const Text('Update Product'),
            automaticallyImplyLeading: true,),
          body: SingleChildScrollView(
              child:Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                          TextFields(controller: updatedName,
                            title: "Enter Product Name",),
                      const SizedBox(height: 20,),
                          TextFields(controller: updatedDesc,
                            title: 'Enter Product Description',),
                      const SizedBox(height: 20,),
                          TextFields(controller: updatedPrice,
                            title: 'Enter Product Price',),
                      const SizedBox(height: 20,),
                       ElevatedButton(
                          onPressed: () {
                            controller.products[0].productName=updatedName.text;
                            controller.products[0].productDescription=updatedDesc.text;
                            // controller.products[0].price =updatedPrice.text as double?;
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white),
                          child: const Text('Update'),
                        ),
                    ],
                  ),
                ),
              ),

          ),
        ),);
  }
}
