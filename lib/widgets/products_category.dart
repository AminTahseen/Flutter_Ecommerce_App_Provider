import 'package:ecommerce_app_provider/widgets/product_category_item.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'All',
      'Footwear',
      'Electronics',
      'Clothing',
      'Others'
    ];

    void setSelectedIndex(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: 85,
      width: double.infinity,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var i = 0; i < 5; i++)
            InkWell(
              child: ProductCategoryItem(category[i], i, selectedIndex),
              onTap: () => setSelectedIndex(i),
            ),
        ],
      ),
    );
  }
}
