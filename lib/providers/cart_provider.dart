import 'package:ecommerce_app_provider/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  var _cart = {} as Cart;
  Cart get getUserCart => _cart;

  void assignNewCart(Cart cart) {
    _cart = cart;
    notifyListeners();
  }
}
