import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/category_product_args.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/screens/categories_products_screen.dart';
import 'package:ecommerce_app_provider/screens/favourites_screen.dart';
import 'package:ecommerce_app_provider/screens/home_screen.dart';
import 'package:ecommerce_app_provider/screens/login_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Max Huang",
                style: TextStyle(
                    color: HexColor(mainAppColorCode),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Text(
              "huang_max@appmaking.co",
              style: TextStyle(color: Colors.black54),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH_Ex_HfBbLnp8rW4AFrQBAlyLZ_bx5uJBzw&usqp=CAU"),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName, (Route<dynamic> route) => false),
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            title: Text('Favourite'),
            onTap: () =>
                Navigator.of(context).pushNamed(FavouriteScreen.routeName),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(
                context, CategoriesProducts.routeName,
                arguments: CategoryProductsArgs(-1)),
            leading: Icon(Icons.add_shopping_cart_outlined),
            title: Text('All Products'),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
              style: TextStyle(color: Colors.black38),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName, (Route<dynamic> route) => false),
          ),
        ],
      ),
    );
  }
}
