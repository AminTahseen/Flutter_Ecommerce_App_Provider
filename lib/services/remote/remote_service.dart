import 'dart:convert';

import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<String>?> getCategories() async {
    var client = http.Client();
    var uri = Uri.parse(BASE_URL_CATEGORIES);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return (jsonDecode(json) as List<dynamic>).cast<String>();
    }
  }

  Future<List<Product>?> getCategoriesProducts(String category) async {
    var client = http.Client();
    var uri = Uri.parse(BASE_URL_CATEGORY_PRODUCTS + '$category');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return productFromJson(json);
    }
  }
}
