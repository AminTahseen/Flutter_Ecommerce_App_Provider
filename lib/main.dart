import 'package:ecommerce_app_provider/providers/categories_provider.dart';
import 'package:ecommerce_app_provider/providers/product_provider.dart';
import 'package:ecommerce_app_provider/screens/cart_screen.dart';
import 'package:ecommerce_app_provider/screens/categories_products_screen.dart';
import 'package:ecommerce_app_provider/screens/filter_screen.dart';
import 'package:ecommerce_app_provider/screens/home_screen.dart';
import 'package:ecommerce_app_provider/screens/login_screen.dart';
import 'package:ecommerce_app_provider/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CategoriesProducts.routeName: (context) => CategoriesProducts(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
    );
  }
}
