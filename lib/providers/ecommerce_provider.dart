import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';

class EcommerceProvider extends ChangeNotifier {
  final List<String> _categoriesList = [];
  final List<Product> _productsList = [];

  List<String> get getCategoriesList => _categoriesList;
  List<Product> get getProductsList => _productsList;

  void clearCategoriesList() {
    _categoriesList.clear();
    notifyListeners();
  }

  void addCategories(String category) {
    _categoriesList.add(category);
    notifyListeners();
  }

  void clearProductList() {
    _productsList.clear();
    notifyListeners();
  }

  void addProducts(Product product) {
    _productsList.add(product);
    notifyListeners();
  }
}
