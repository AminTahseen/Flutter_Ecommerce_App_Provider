import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/helpers/utils/product_details_args.dart';
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
        title: (args.product as Product).title,
        hasBottom: false,
        key: _scaffoldkey,
        isBackButton: true,
      ),
      body: args != null
          ? ProductDetails(product: args.product as Product)
          : Text('data'),
    );
  }
}
