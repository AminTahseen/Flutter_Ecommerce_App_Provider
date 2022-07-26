import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favouriteProductsList = [];
  List<Product> get getFavouriteProductsList => _favouriteProductsList;

  void addProductToFavourite(Product product) {
    _favouriteProductsList.add(product);
    notifyListeners();
  }

  void removeProductFromFavourite(Product product) {
    _favouriteProductsList.remove(product);
    notifyListeners();
  }
}
