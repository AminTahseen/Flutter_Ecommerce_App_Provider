import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                height: 330,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ), // should be a paged
              // view.
              Positioned(
                child: FloatingActionButton(
                    elevation: 2,
                    child: Icon(
                      Icons.favorite_border,
                    ),
                    backgroundColor: HexColor(mainAppColorCode),
                    onPressed: () {}),
                bottom: 20,
                right: 20,
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('#26de81'),
                  ),
                ),
                top: 20,
                left: 20,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              product.category.toUpperCase(),
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              product.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                height: 1.5,
                color: Color(0xFF6F8398),
              ),
            ),
          ),
          Container(
            child: Center(
              child: RatingBarIndicator(
                itemPadding: const EdgeInsets.all(10.0),
                rating: product.rating.rate,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              child: const Text('Add To Cart'),
              style:
                  ElevatedButton.styleFrom(primary: HexColor(mainAppColorCode)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
