import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favourite';

  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      appBar: mainAppBar(
        context: context,
        title: 'Favourites',
        hasBottom: false,
        key: _scaffoldkey,
        isBackButton: true,
      ),
      body: Center(
        child: Text('favourite Screen'),
      ),
    );
  }
}
