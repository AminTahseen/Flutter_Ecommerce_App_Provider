import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:flutter/material.dart';

class FilterCategoryItem extends StatelessWidget {
  int isSelected;
  int index;
  String category;
  FilterCategoryItem(
      {required this.category, required this.isSelected, required this.index});

  @override
  Widget build(BuildContext context) {
    return isSelected == index
        ? Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: HexColor(mainAppColorCode)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(category,
                  style: TextStyle(
                      color: HexColor(mainAppColorCode),
                      fontWeight: FontWeight.bold)),
            ),
          )
        : Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.grey.shade400),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                this.category,
                style: TextStyle(
                    color: Colors.grey.shade400, fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
