import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/category_bloc.dart';
import 'package:pharmacy/src/model/category_model.dart';
import 'package:pharmacy/src/ui/category/subcategory_screen.dart';
import 'package:pharmacy/src/ui/item_info/item_list_screen.dart';
import 'package:pharmacy/src/widget/search_widget.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    categoryBloc.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Каталог",
          style: TextStyle(
            color: Color(0xFF1C1C1E),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: categoryBloc.fetchCategory,
        builder: (context, AsyncSnapshot<CategoryModel> snapshot) {
          if (snapshot.hasData) {
            List<CategoryResult> categoryResult = snapshot.data!.results;
            return Center(
              child: categoryResult.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          children: const [
                            Spacer(),
                            CircularProgressIndicator.adaptive(),
                            Spacer(),
                          ],
                        ),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      children: [
                        const SearchWidget(),
                        SizedBox(
                          height: 10 * h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: categoryResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (categoryResult[index].childs.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) {
                                          return SubCategory(
                                            name: categoryResult[index].name,
                                            childs:
                                                categoryResult[index].childs,
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ItemListScreen(
                                            catalogName:
                                                categoryResult[index].name,
                                            catalogId: categoryResult[index].id,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(
                                    top: 16 * h,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 12 * w,
                                      ),
                                      CachedNetworkImage(
                                        imageUrl: categoryResult[index].image,
                                        placeholder: (context, url) => const CircularProgressIndicator.adaptive(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        height: 42 * o,
                                        width: 42 * o,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 12 * w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          categoryResult[index].name,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
            );
          }
          return Shimmer.fromColors(
            baseColor: AppTheme.shimmerBaseColor,
            highlightColor: AppTheme.shimmerHighColor,
            child:  ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 16 * w, right: 16 * w, bottom: 4 * h),
                  height: 60 * h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppTheme.blue,
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
