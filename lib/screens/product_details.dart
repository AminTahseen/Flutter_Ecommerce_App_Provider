import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  static const routeName = '/productDetails';
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      key: _scaffoldkey,
      appBar: mainAppBar(
        context: context,
        title: 'Details',
        hasBottom: false,
        key: _scaffoldkey,
      ),
    );
  }
}
