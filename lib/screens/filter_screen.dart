import 'package:ecommerce_app_provider/helpers/constants.dart';
import 'package:ecommerce_app_provider/helpers/utils/hex_color.dart';
import 'package:ecommerce_app_provider/providers/categories_provider.dart';
import 'package:ecommerce_app_provider/services/remote/remote_service.dart';
import 'package:ecommerce_app_provider/widgets/filter_category_item.dart';
import 'package:ecommerce_app_provider/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isCategLoaded = false;
  int selectedIndex = 0;
  RangeValues values = RangeValues(1, 300);
  RangeLabels labels = RangeLabels('1', "300");

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCategories(context);
  }

  getCategories(BuildContext context) async {
    List<String>? categories = await RemoteService().getCategories();
    if (categories != null) {
      context.read<CategoryProvider>().clearCategoriesList();
      setState(() {
        isCategLoaded = true;
      });
      for (var item in categories) {
        print('Category - $item');
        context.read<CategoryProvider>().addCategories(item);
      }
    }
  }

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: HexColor(mainBgColorCode),
      appBar: mainAppBar(
        context: context,
        title: 'Filters',
        hasBottom: false,
        key: _scaffoldkey,
        isBackButton: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
          ),

          // Categories list in box
          isCategLoaded
              ? Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 130,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(
                      context.read<CategoryProvider>().getCategoriesList.length,
                      (index) {
                        return InkWell(
                          onTap: () => setSelectedIndex(index),
                          child: FilterCategoryItem(
                            category: context
                                .read<CategoryProvider>()
                                .getCategoriesList[index]
                                .toUpperCase(),
                            isSelected: selectedIndex,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Price',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
          ),
          Container(
            child: RangeSlider(
                divisions: 5,
                activeColor: Colors.red[700],
                inactiveColor: Colors.grey,
                min: 1,
                max: 300,
                values: values,
                labels: labels,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    values = values;
                    labels = RangeLabels('${value.start.toInt().toString()}\$',
                        '${value.start.toInt().toString()}\$');
                  });
                }),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Apply Filter'),
              style:
                  ElevatedButton.styleFrom(primary: HexColor(mainAppColorCode)),
              onPressed: () {},
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: Center(
              child: Text(
                'Cancel',
                style: TextStyle(color: HexColor(mainAppColorCode)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
