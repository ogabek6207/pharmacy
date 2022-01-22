// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/model/category_model.dart';
import 'package:pharmacy/src/ui/item_info/item_list_screen.dart';
import 'package:pharmacy/src/widget/search_widget.dart';

class SubCategory extends StatefulWidget {

  final List<CategoryResult> childs;
  final name;
  const SubCategory({Key? key,
    required this.name,
    required this.childs,
  }) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:  Icon(
            Icons.arrow_back_ios_new,
            color: const Color(0xFF3F8AE0),
            size: 24*o,
          ),
        ),
        title: SizedBox(
          height: 44*h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  color: Color(0xFF1C1C1E),
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
           const SearchWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.childs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ItemListScreen(
                            catalogName: widget.childs[index].name,
                            catalogId: widget.childs[index].id,
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 48*h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                         SizedBox(
                          width: 12*w,
                        ),
                        Expanded(
                          child: Text(
                            widget.childs[index].name,
                            style:  TextStyle(
                              color: const Color(0xFF1C1C1E),
                              fontSize: 15*o,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SvgPicture.asset("assets/icons/arrow.svg"),
                         SizedBox(width: 16.0*w),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
