import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/category_product_args.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/providers/cart_provider.dart';
import 'package:ecommerce_app_provider/providers/categories_provider.dart';
import 'package:ecommerce_app_provider/screens/categories_products_screen.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:ecommerce_app_provider/widgets/product_list.dart';
import 'package:ecommerce_app_provider/widgets/products_category.dart';
import 'package:ecommerce_app_provider/widgets/progress_widget.dart';
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

  getUserCart(int id) async {
    var userCart = await RemoteService().getUserCart(id);
    if (userCart != null) {
      print('cart is : ${userCart.toString()}');
      context.read<CartProvider>().assignNewCart(userCart);
    } else {
      print('cart is : null');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getCategories(context);
    this.getUserCart(1);
  }

  void getCategories(BuildContext context) async {
    List<String>? categories = await RemoteService().getCategories();
    if (categories != null) {
      context.read<CategoryProvider>().clearCategoriesList();
      setState(() {
        isCategLoaded = true;
      });

      for (var item in categories) {
        print('Category - $item');
        context.read<CategoryProvider>().addCategories(item);
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
              isCategLoaded ? ProductCategory() : ShowProgress(),
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
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                              context, CategoriesProducts.routeName,
                              arguments: CategoryProductsArgs(-1))
                          .then((value) =>
                              value == true ? getCategories(context) : null),
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 15.0, color: HexColor('#95a5a6')),
                      ),
                    )
                  ],
                ),
              ),
              ProductList(
                asyncFunc: () => getCategories(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
