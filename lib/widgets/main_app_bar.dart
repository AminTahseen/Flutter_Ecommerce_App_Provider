import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/screens/cart_screen.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(
    {required BuildContext context,
    required String title,
    required bool hasBottom}) {
  return AppBar(
    backgroundColor: HexColor("#ff5252"),
    leading: IconButton(
        onPressed: () {}, icon: Icon(Icons.auto_awesome_mosaic_outlined)),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
        icon: Icon(
          Icons.shopping_bag_outlined,
        ),
      )
    ],
    bottom: hasBottom == true
        ? AppBar(
            backgroundColor: HexColor("#ff5252"),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: double.infinity,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5.0, top: 5.0),
                          hintText: 'Search for something',
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.only(left: 10.0),
                  height: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.insert_chart_outlined_sharp),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        : null,
  );
}
