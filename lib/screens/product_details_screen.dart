import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/constants/utils/product_details_args.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:ecommerce_app_provider/widgets/product_detail.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  static const routeName = '/productDetails';
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as ProductDetailsArgs;
    }
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      key: _scaffoldkey,
      appBar: mainAppBar(
        context: context,
        title: 'Details',
        hasBottom: false,
        key: _scaffoldkey,
      ),
      body: Center(
        child: args != null
            ? ProductDetails(product: args.product as Product)
            : Text('data'),
      ),
    );
  }
}
