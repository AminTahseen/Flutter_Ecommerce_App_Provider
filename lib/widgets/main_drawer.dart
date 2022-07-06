import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/screens/home_screen.dart';
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
                    color: HexColor("#ff5252"),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Text(
              "sundar@appmaking.co",
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
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            title: Text('Favorties'),
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
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
          ),
        ],
      ),
    );
  }
}
