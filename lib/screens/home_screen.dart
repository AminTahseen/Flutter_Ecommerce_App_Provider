import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/widgets/product_list.dart';
import 'package:ecommerce_app_provider/widgets/products_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f1f2f6'),
      appBar: AppBar(
        backgroundColor: HexColor("#ff5252"),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.auto_awesome_mosaic_outlined)),
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
        ],
        bottom: AppBar(
          backgroundColor: HexColor("#ff5252"),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 5.0, top: 5.0),
                        hintText: 'Search for something',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 10.0),
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.insert_chart_outlined_sharp),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
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
              ProductCategory(),
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
