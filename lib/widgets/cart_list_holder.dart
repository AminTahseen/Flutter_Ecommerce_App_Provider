import 'package:ecommerce_app_provider/providers/cart_provider.dart';
import 'package:ecommerce_app_provider/providers/product_provider.dart';
import 'package:ecommerce_app_provider/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListHolder extends StatelessWidget {
  const CartListHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: context.read<CartProvider>().getUserCart.products.length,
        itemBuilder: (context, position) {
          return CartItem(
              context.read<ProductProvider>().getSingleProductById(context
                  .read<CartProvider>()
                  .getUserCart
                  .products[position]
                  .productId),
              context
                  .read<CartProvider>()
                  .getUserCart
                  .products[position]
                  .quantity);
        },
      ),
    );
  }
}
