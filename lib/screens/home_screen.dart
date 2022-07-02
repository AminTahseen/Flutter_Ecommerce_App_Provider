import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/product_list.dart';
import 'package:ecommerce_app_provider/widgets/products_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f1f2f6'),
      appBar: mainAppBar(context: context, title: 'Home', hasBottom: true),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 160,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor('#f1f2f6'),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/main_banner.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ProductCategory(),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View All',
                      style:
                          TextStyle(fontSize: 15.0, color: HexColor('#a4b0be')),
                    )
                  ],
                ),
              ),
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
