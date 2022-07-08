import 'package:ecommerce_app_provider/constants/utils/category_product_args.dart';
import 'package:ecommerce_app_provider/providers/ecommerce_provider.dart';
import 'package:ecommerce_app_provider/screens/categories_products_screen.dart';
import 'package:ecommerce_app_provider/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void setSelectedIndex(int index, String category) {
      setState(() {
        selectedIndex = index;
      });
      Navigator.pushNamed(
        context,
        CategoriesProducts.routeName,
        arguments: CategoryProductsArgs(index),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: 85,
      width: double.infinity,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var index = 0;
              index <
                  context.watch<EcommerceProvider>().getCategoriesList.length;
              index++)
            InkWell(
              onTap: () => setSelectedIndex(index, 'c'),
              child: ProductCategoryItem(
                context.watch<EcommerceProvider>().getCategoriesList[index],
                index,
                selectedIndex,
              ),
            ),
        ],
      ),
    );
  }
}
