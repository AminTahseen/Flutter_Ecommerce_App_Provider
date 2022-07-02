import 'package:ecommerce_app_provider/screens/cart_screen.dart';
import 'package:ecommerce_app_provider/screens/home_screen.dart';
import 'package:ecommerce_app_provider/screens/product_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
      },
    );
  }
}
