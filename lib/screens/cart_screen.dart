import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  static const routeName = '/cart';

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      key: _scaffoldkey,
      appBar: mainAppBar(
        context: context,
        title: 'Cart',
        hasBottom: false,
        key: _scaffoldkey,
      ),
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
