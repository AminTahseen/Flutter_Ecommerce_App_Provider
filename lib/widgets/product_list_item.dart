import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Color _cardColor;
  final String _imageURL;
  final String _productName;
  final String _productPrice;
  const ProductListItem(
      this._cardColor, this._imageURL, this._productName, this._productPrice);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this._cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 100,
                height: 100,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: _imageURL,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                _productName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                '\$ $_productPrice',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
