import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/category_product_args.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/helpers/utils/product_details_args.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/providers/categories_provider.dart';
import 'package:ecommerce_app_provider/providers/product_provider.dart';
import 'package:ecommerce_app_provider/screens/filter_screen.dart';
import 'package:ecommerce_app_provider/screens/product_details_screen.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CategoriesProducts extends StatefulWidget {
  static const routeName = '/category/product';
  CategoriesProducts({Key? key}) : super(key: key);

  @override
  _CategoriesProductsState createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  var hasLoaded = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  getCategoryProduct(String category) async {
    List<Product>? products =
        await RemoteService().getCategoriesProducts(category);

    if (products != null) {
      context.read<ProductProvider>().clearProductList();
      setState(() {
        hasLoaded = true;
      });
      print('products : $products');
      for (var item in products) {
        context.read<ProductProvider>().addProducts(item);
      }
    } else {
      print('null');
    }
  }

  getAllProduct() async {
    List<Product>? products = await RemoteService().getAllProducts();

    if (products != null) {
      context.read<ProductProvider>().clearProductList();
      setState(() {
        hasLoaded = true;
      });
      print('products : $products');
      for (var item in products) {
        context.read<ProductProvider>().addProducts(item);
      }
    } else {
      print('null');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)!.settings.arguments as CategoryProductsArgs;
      if (args.index != -1) {
        getCategoryProduct(
            context.read<CategoryProvider>().getCategoriesList[args.index]);
      } else {
        getAllProduct();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CategoryProductsArgs;

    return Scaffold(
      key: _scaffoldkey,
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      appBar: mainAppBar(
        context: context,
        title: 'Products',
        hasBottom: false,
        key: _scaffoldkey,
        isBackButton: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: args.index != -1
                      ? Text(
                          'Showing for \'${context.read<CategoryProvider>().getCategoriesList[args.index]}\'',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Showing all products',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.only(top: 10.0, right: 10.0),
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
            hasLoaded
                ? Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: (MediaQuery.of(context).size.width /
                            MediaQuery.of(context).size.height),
                        children: List.generate(
                          context
                              .read<ProductProvider>()
                              .getProductsList
                              .length,
                          (index) {
                            return FadeIn(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInCirc,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  ProductDetailsScreen.routeName,
                                  arguments: ProductDetailsArgs(
                                    context
                                        .read<ProductProvider>()
                                        .getProductsList[index],
                                  ),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 200,
                                            padding: const EdgeInsets.all(10.0),
                                            height: 200,
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/loading.gif',
                                              image: context
                                                  .read<ProductProvider>()
                                                  .getProductsList[index]
                                                  .image,
                                            ),
                                          ),
                                          Positioned(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '\$ ${context.read<ProductProvider>().getProductsList[index].price.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: HexColor('#26de81'),
                                                borderRadius:
                                                    new BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  topRight:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomRight:
                                                      const Radius.circular(
                                                    10.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            top: 10,
                                            left: 10,
                                          )
                                        ],
                                      ),
                                      ListTile(
                                        title: Text(
                                          context
                                              .read<ProductProvider>()
                                              .getProductsList[index]
                                              .title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            '${context.read<ProductProvider>().getProductsList[index].category.toUpperCase()}',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          ),
                                        ),
                                      ),
                                      RatingBarIndicator(
                                        rating: context
                                            .read<ProductProvider>()
                                            .getProductsList[index]
                                            .rating
                                            .rate,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: HexColor(mainAppColorCode),
                                        ),
                                        itemCount: 5,
                                        itemSize: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
