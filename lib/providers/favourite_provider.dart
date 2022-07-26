import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favouriteProductsList = [];
  List<Product> get getFavouriteProductsList => _favouriteProductsList;

  void addProductToFavourite(Product product) {
    var data = getFavouriteProductsList
        .where((row) => (row.title.contains(product.title)));
    if (data.length >= 1) {
    } else {
      _favouriteProductsList.add(product);
    }
    notifyListeners();
  }

  void removeProductFromFavourite(Product product) {
    var data = getFavouriteProductsList
        .where((row) => (row.title.contains(product.title)));
    if (data.length >= 1) {
      _favouriteProductsList.remove(product);
      notifyListeners();
    }
  }

  bool getSingleItem(var title) {
    var data =
        getFavouriteProductsList.where((row) => (row.title.contains(title)));
    if (data.length >= 1) {
      return true;
    } else {
      return false;
    }
  }
}
