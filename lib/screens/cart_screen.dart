import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context: context, title: 'Cart', hasBottom: false),
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
