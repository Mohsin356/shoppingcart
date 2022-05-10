import 'package:flutter/material.dart';
import 'package:shoppingcart/views/screens/change_name.dart';
import 'package:shoppingcart/views/screens/shopping_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Shopping(),
      getPages: [
        GetPage(name: '/Shopping', page: () =>  Shopping()),
        GetPage(name: '/ProductName',page: () =>  ProductName()),
      ],
    );
  }
}


