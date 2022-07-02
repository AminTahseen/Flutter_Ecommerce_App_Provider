import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> productCardColor = [
      HexColor('#55efc4'),
      HexColor('#fab1a0'),
      HexColor('#74b9ff'),
      HexColor('#a29bfe'),
      HexColor('#ff7675'),
    ];
    List<String> productImagesURL = [
      'https://i.pinimg.com/originals/34/86/54/348654cc9b185bcccbeea80d2fae2bf8.png',
      'https://www.downloadclipart.net/large/iphone-png-background-image.png',
      'https://terrigen-cdn-dev.marvel.com/content/prod/2x/b19qdr75ots._cla_2140_2000_81o9kghmu8l.png_0_0_2140_20000.0_0.0_2140.0_2000.0_ac_ul1500_-removebg-preview.png',
      'https://www.pngall.com/wp-content/uploads/5/Pant-PNG-Pic.png',
      'https://api.sammobile.com/static/samsung-galaxy-watch-active_black_front_titled-left.png?1588065185'
    ];
    List<String> productNames = [
      'Nike Shoes',
      'Smart Phone',
      'Marvel Shirt',
      'Slim Jeans',
      'Smart Watch'
    ];

    List<String> productsPrice = [
      '\$12.0',
      '\$100.50',
      '\$15.35',
      '\$11.50',
      '\$50.90'
    ];

    return Container(
      margin: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.45,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(productNames.length, (index) {
          return ProductListItem(
            productCardColor[index],
            productImagesURL[index],
            productNames[index],
            productsPrice[index],
          );
        }),
      ),
    );
  }
}
