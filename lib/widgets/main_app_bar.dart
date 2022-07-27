import 'package:badges/badges.dart';
import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/screens/cart_screen.dart';
import 'package:ecommerce_app_provider/screens/filter_screen.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar({
  required BuildContext context,
  required String title,
  required bool hasBottom,
  required GlobalKey<ScaffoldState> key,
  bool isBackButton = false,
  bool isCartVisible = true,
}) {
  return AppBar(
    backgroundColor: HexColor(mainAppColorCode),
    leading: isBackButton == true
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          )
        : IconButton(
            onPressed: () => key.currentState!.openDrawer(),
            icon: Icon(Icons.auto_awesome_mosaic_outlined),
          ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
      isCartVisible
          ? InkWell(
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                margin: const EdgeInsets.only(right: 5.0),
                child: Badge(
                  badgeColor: Colors.yellow,
                  badgeContent: Text(
                    '5',
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
              ),
            )
          : Container()
    ],
    bottom: hasBottom == true
        ? PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: HexColor(mainAppColorCode),
              child: Row(
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
                            contentPadding:
                                EdgeInsets.only(left: 5.0, top: 5.0),
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
                      onPressed: () =>
                          Navigator.pushNamed(context, FilterScreen.routeName),
                      icon: Icon(Icons.insert_chart_outlined_sharp),
                      color: HexColor(mainAppColorCode),
                    ),
                  ),
                ],
              ),
            ),
          )
        : null,
  );
}
