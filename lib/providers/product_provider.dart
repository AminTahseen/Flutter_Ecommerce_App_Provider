import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _productsList = [];
  List<Product> get getProductsList => _productsList;
  void clearProductList() {
    _productsList.clear();
    notifyListeners();
  }

  void addProducts(Product product) {
    _productsList.add(product);
    notifyListeners();
  }
}
