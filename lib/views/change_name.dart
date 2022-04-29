import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/controllers/shopping_controller.dart';
import 'package:shoppingcart/views/shopping_page.dart';

class ProductName extends StatelessWidget {
  ProductName({Key? key}) : super(key: key);
  final textChanged = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        GetX<ShoppingController>(
          builder: ((controller) {
            return Center(
              child: Column(
                children: [
                    Text(controller.products[0].productName.toString()),
                  ElevatedButton(
                    onPressed: () {
                        Get.to(() => Shopping(), arguments: [
                  {controller.products[0].productName.toString(): 'First data'},
                  ]);
                        controller.update();},
                    // {
                    //   controller.products[0].productName='Hello';
                    //   controller.update();
                    // },
                    child: const Text('Go to page 1'),
                  ),
                ],
              ),
            );
          }),),

      ),);
  }
}




   //   final textController= Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body:
//           GetX<Controller>(
//             builder: ((controller){
//               return Center(
//                   child: Column(
//                   children: [
//                       TextField(controller: controller.textController),
//                       ElevatedButton(
//                         onPressed: () => Get.back(),
//                         child:  const Text('Go to page 1'),
//                       ),
//             ],
//           ),
//                   );}),),
//
// ),
//     );
//   }
// }
