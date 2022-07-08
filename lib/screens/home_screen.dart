import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/providers/ecommerce_provider.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:ecommerce_app_provider/widgets/product_list.dart';
import 'package:ecommerce_app_provider/widgets/products_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isCategLoaded = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    this.getCategories(context);
  }

  getCategories(BuildContext context) async {
    List<String>? categories = await RemoteService().getCategories();
    if (categories != null) {
      context.read<EcommerceProvider>().clearCategoriesList();
      setState(() {
        isCategLoaded = true;
      });
      for (var item in categories) {
        print('Category - $item');
        context.read<EcommerceProvider>().addCategories(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      appBar: mainAppBar(
          context: context, title: 'Home', hasBottom: true, key: _scaffoldkey),
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
              isCategLoaded ? ProductCategory() : CircularProgressIndicator(),
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
