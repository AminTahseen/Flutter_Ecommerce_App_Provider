import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/helpers/utils/product_details_args.dart';
import 'package:ecommerce_app_provider/providers/favourite_provider.dart';
import 'package:ecommerce_app_provider/screens/product_details_screen.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favourite';

  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  getList() {
    for (var item
        in context.read<FavouriteProvider>().getFavouriteProductsList) {
      print(item.title);
    }
  }

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
      body: context.read<FavouriteProvider>().getFavouriteProductsList.length !=
              0
          ? Container(
              height: MediaQuery.of(context).size.height,
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
                        .read<FavouriteProvider>()
                        .getFavouriteProductsList
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
                                  .read<FavouriteProvider>()
                                  .getFavouriteProductsList[index],
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
                                      height: 250,
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/loading.gif',
                                        image: context
                                            .read<FavouriteProvider>()
                                            .getFavouriteProductsList[index]
                                            .image,
                                      ),
                                    ),
                                    Positioned(
                                      child: FloatingActionButton(
                                        elevation: 2,
                                        child: Icon(
                                          Icons.favorite,
                                        ),
                                        backgroundColor: Colors.red,
                                        onPressed: () => context
                                            .read<FavouriteProvider>()
                                            .removeProductFromFavourite(context
                                                    .read<FavouriteProvider>()
                                                    .getFavouriteProductsList[
                                                index]),
                                      ),
                                      top: 10,
                                      right: 10,
                                    )
                                  ],
                                ),
                                ListTile(
                                  title: Text(
                                    context
                                        .read<FavouriteProvider>()
                                        .getFavouriteProductsList[index]
                                        .title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      '\$ ${context.read<FavouriteProvider>().getFavouriteProductsList[index].price}',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 20),
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
                ),
              ),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.face_retouching_natural_outlined,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Oops',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: HexColor(mainAppColorCode),
                      ),
                    ),
                  ),
                  Text('You Do Not Have Any favourites..'),
                ],
              ),
            ),
    );
  }
}
