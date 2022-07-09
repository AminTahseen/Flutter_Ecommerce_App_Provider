import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:ecommerce_app_provider/widgets/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: InkWell(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                              imageURL: product.image,
                            ));
                  },
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                  ),
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
                bottom: 10,
                right: 10,
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
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0))),
                ),
                top: 10,
                left: 10,
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
                  color: HexColor(mainAppColorCode),
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
