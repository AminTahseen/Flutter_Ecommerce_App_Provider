import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/models/products.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  Product product;
  int quantity;
  CartItem(this.product, this.quantity);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void increment() {
    setState(() {
      widget.quantity += 1;
    });
  }

  void decrement() {
    if (widget.quantity > 1) {
      setState(() {
        widget.quantity -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: widget.product.image,
          ),
          title: Text(
            widget.product.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('\$ ${widget.product.price}'),
              ],
            ),
          ),
          trailing: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.remove),
                  onPressed: () => decrement(),
                ),
                new Text(
                  widget.quantity.toString(),
                  style: TextStyle(
                      fontSize: 20, color: HexColor(mainAppColorCode)),
                ),
                new IconButton(
                    icon: new Icon(Icons.add), onPressed: () => increment()),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
