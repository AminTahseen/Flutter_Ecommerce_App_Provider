import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/models/cart.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/providers/cart_provider.dart';
import 'package:ecommerce_app_provider/providers/product_provider.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/cart_list_holder.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:ecommerce_app_provider/widgets/main_drawer.dart';
import 'package:ecommerce_app_provider/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var hasLoaded = false;
  var total_Bill = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  getUserCart(int id) async {
    var userCart = await RemoteService().getUserCart(id);
    if (userCart != null) {
      setState(() {
        hasLoaded = true;
      });
      print('cart is : ${userCart.toString()}');
      context.read<CartProvider>().assignNewCart(userCart);
    } else {
      print('cart is : null');
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

  getTotalBill() {
    var totalBill = 0.0;
    for (var i = 0;
        i < context.read<CartProvider>().getUserCart.products.length;
        i++) {
      var product = context.read<ProductProvider>().getSingleProductById(
            context.read<CartProvider>().getUserCart.products[i].productId,
          );

      var quantity =
          context.read<CartProvider>().getUserCart.products[i].quantity;
      totalBill += (product.price * quantity);
    }
    setState(() {
      total_Bill = totalBill;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllProduct();
    getUserCart(1);
    getTotalBill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: HexColor(mainBgColorCode),
      key: _scaffoldkey,
      appBar: mainAppBar(
        context: context,
        title: 'Cart',
        hasBottom: false,
        key: _scaffoldkey,
        isBackButton: true,
        isCartVisible: false,
      ),
      body: hasLoaded
          ? Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'My Cart',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CartListHolder(),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10.0, right: 20.0, left: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Bill : ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '\$$total_Bill',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.10,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                          primary: HexColor(mainAppColorCode)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          : ShowProgress(),
    );
  }
}
