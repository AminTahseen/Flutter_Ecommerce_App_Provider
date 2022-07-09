import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<String> _categoriesList = [];

  List<String> get getCategoriesList => _categoriesList;

  void clearCategoriesList() {
    _categoriesList.clear();
    notifyListeners();
  }

  void addCategories(String category) {
    _categoriesList.add(category);
    notifyListeners();
  }
}
