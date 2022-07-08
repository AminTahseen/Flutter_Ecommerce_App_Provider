import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/constants/utils/category_product_args.dart';
import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/constants/utils/product_details_args.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/providers/ecommerce_provider.dart';
import 'package:ecommerce_app_provider/screens/product_details_screen.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
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
      context.read<EcommerceProvider>().clearProductList();
      setState(() {
        hasLoaded = true;
      });
      print('products : $products');
      for (var item in products) {
        context.read<EcommerceProvider>().addProducts(item);
      }
    } else {
      print('null');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)!.settings.arguments as CategoryProductsArgs;
      getCategoryProduct(
          context.read<EcommerceProvider>().getCategoriesList[args.index]);
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Showing products for \'${context.read<EcommerceProvider>().getCategoriesList[args.index]}\'',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                              .read<EcommerceProvider>()
                              .getProductsList
                              .length,
                          (index) {
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                ProductDetailsScreen.routeName,
                                arguments: ProductDetailsArgs(
                                  context
                                      .read<EcommerceProvider>()
                                      .getProductsList[index],
                                ),
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      height: 200,
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/loading.gif',
                                        image: context
                                            .read<EcommerceProvider>()
                                            .getProductsList[index]
                                            .image,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        context
                                            .read<EcommerceProvider>()
                                            .getProductsList[index]
                                            .title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Price \$${context.read<EcommerceProvider>().getProductsList[index].price.toString()}',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      ),
                                    ),
                                    RatingBarIndicator(
                                      rating: context
                                          .read<EcommerceProvider>()
                                          .getProductsList[index]
                                          .rating
                                          .rate,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 30.0,
                                    ),
                                  ],
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
