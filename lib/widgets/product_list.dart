import 'package:ecommerce_app_provider/helpers/utils/product_details_args.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/providers/product_provider.dart';
import 'package:ecommerce_app_provider/screens/product_details_screen.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final void Function() asyncFunc;

  const ProductList({required this.asyncFunc});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool hasLoaded = false;
  @override
  void initState() {
    super.initState();

    this.getProducts(context);
  }

  getProducts(BuildContext context) async {
    List<Product>? products = await RemoteService().getAllProducts();
    if (products != null) {
      setState(() {
        hasLoaded = true;
      });
      context.read<ProductProvider>().clearProductList();
      for (var item in products) {
        context.read<ProductProvider>().addProducts(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.55,
      child: hasLoaded
          ? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                context
                    .read<ProductProvider>()
                    .getProductsList
                    .sublist(0, 4)
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
                      ).then((value) =>
                          value == true ? widget.asyncFunc.call() : null),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              height: 100,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                image: context
                                    .read<ProductProvider>()
                                    .getProductsList[index]
                                    .image,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                context
                                    .read<ProductProvider>()
                                    .getProductsList[index]
                                    .title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Price \$${context.read<ProductProvider>().getProductsList[index].price.toString()}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
