import 'package:ecommerce_app_provider/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  var _cart;
  bool showValue = false;
  Cart get getUserCart => _cart;

  void assignNewCart(Cart cart) {
    _cart = cart;
    showValue = true;
    notifyListeners();
  }

  void addProductToCart(CartProduct product) {
    if (getUserCart.products.length != 0) {
      for (var i = 0; i < getUserCart.products.length; i++) {
        if (getUserCart.products[i].productId == product.productId) {
          var updatedProd = getUserCart.products[i];
          updatedProd.quantity += 1;
          getUserCart.products[i] = updatedProd;
        } else {
          //getUserCart.products.add(product);
        }
      }
    } else {
      getUserCart.products.add(product);
    }
  }
}
