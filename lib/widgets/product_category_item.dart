import 'package:ecommerce_app_provider/constants/constants.dart';
import 'package:ecommerce_app_provider/constants/utils/hex_color.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatefulWidget {
  final String _category;
  final int _index;
  final int _selectedIndex;
  const ProductCategoryItem(this._category, this._index, this._selectedIndex);

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: widget._index == widget._selectedIndex
            ? Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: HexColor(mainAppColorCode),
                    border: Border.all(
                      color: HexColor(mainAppColorCode),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget._category.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 20.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget._category.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor('#a4b0be')),
                      ),
                    )
                  ],
                ),
              ),
        // here it is ending
      ),
    );
  }
}
