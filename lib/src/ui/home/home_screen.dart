import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/choice_model.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/model/sales_model.dart';
import 'package:pharmacy/src/ui/dialog/bottom_dialog.dart';
import 'package:pharmacy/src/ui/home/useful_article_screen.dart';
import 'package:pharmacy/src/ui/item_info/item_list_screen.dart';
import 'package:pharmacy/src/widget/horizontal_item_widget.dart';
import 'package:pharmacy/src/widget/search_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    homeBloc.getDrugs();
    homeBloc.getChoice();
    homeBloc.getSales();
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
        shadowColor: AppTheme.white,
        elevation: 0,
        backgroundColor: AppTheme.white,
        title: const SearchWidget(
          width: 0,
          widthRight: 0,
        ),
      ),
      body: Column(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 10 * h,
              ),
              SizedBox(
                height: 113 * h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 113 * o,
                          width: 113 * o,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppTheme.purple,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 14 * w,
                              top: 16 * h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/card.svg"),
                                SizedBox(
                                  height: 10 * h,
                                ),
                                Text(
                                  "Ваша",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 16 * h,
                                  ),
                                ),
                                Text(
                                  "КАРТА",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 22 * h,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 113 * h,
                          width: 113 * w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppTheme.blue.withOpacity(0.9),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10 * w,
                              top: 16 * h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/medical.svg"),
                                SizedBox(
                                  height: 10 * h,
                                ),
                                Text(
                                  "Посмотреть",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 16 * h,
                                  ),
                                ),
                                Text(
                                  "В АПТЕКЕ",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 22 * h,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 113 * o,
                          width: 113 * o,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 14 * w,
                              top: 16 * h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/locatsion.svg"),
                                SizedBox(
                                  height: 10 * h,
                                ),
                                Text(
                                  "Карта",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 16 * h,
                                  ),
                                ),
                                Text(
                                  "АПТЕК",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 22 * o,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 113 * o,
                          width: 113 * o,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppTheme.purple,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 14 * w,
                              top: 16 * h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/card.svg"),
                                SizedBox(
                                  height: 7 * h,
                                ),
                                Text(
                                  "Ваша",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 16 * o,
                                  ),
                                ),
                                Text(
                                  "КАРТА",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 22 * o,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30 * h,
                ),
                height: 160 * h,
                child: StreamBuilder(
                    stream: homeBloc.fetchSales,
                    builder: (context, AsyncSnapshot<SalesModel> snapshot) {
                      if (snapshot.hasData) {
                        List<SalesResult> salesResult = snapshot.data!.results;
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 140.0 * h,
                            autoPlay: true,
                          ),
                          items: salesResult.map((salesResult) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 5.0 * o),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(10 * o),
                                  ),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                      child: CachedNetworkImage(
                                        imageUrl: salesResult.image,
                                      )),
                                );
                              },
                            );
                          }).toList(),
                        );
                      }
                      return Shimmer.fromColors(
                        baseColor: AppTheme.shimmerBaseColor,
                        highlightColor: AppTheme.shimmerHighColor,
                        child: ListView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 16 * w),
                              height: 154 * h,
                              width: 311 * w,
                              decoration: BoxDecoration(
                                color: AppTheme.blue,
                                borderRadius: BorderRadius.circular(10 * o),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 32 * h,
              ),
              SizedBox(
                height: 24 * h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 12 * w,
                    ),
                    Text(
                      "Лучшие предложения",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 * o,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: const ItemListScreen(
                              catalogName: "Лучшие предложения",
                              catalogId: -1,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Все",
                        style: TextStyle(
                          color: AppTheme.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12 * w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280 * h,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                    stream: homeBloc.fetchDrugs,
                    builder: (context, AsyncSnapshot<DrugsModel> snapshot) {
                      if (snapshot.hasData) {
                        List<DrugsResult> drugsRersult = snapshot.data!.results;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(
                              left: 12 * w, top: 16 * h, bottom: 16 * h),
                          itemCount: drugsRersult.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                BottomDialog.drugsDialog(
                                  context,
                                  drugsRersult[index],
                                  drugsRersult,
                                );
                              },
                              child: ItemHorizontalWidget(
                                key: Key(
                                    drugsRersult[index].cardCount.toString()),
                                data: drugsRersult[index],
                              ),
                            );
                          },
                        );
                      }
                      return Shimmer.fromColors(
                        baseColor: AppTheme.shimmerBaseColor,
                        highlightColor: AppTheme.shimmerHighColor,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 12 * h,
                                      bottom: 10 * h,
                                      left: 12 * o,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.blue,
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                    ),
                                    height: 140 * h,
                                    width: 140 * w,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16 * w),
                                    height: 14 * h,
                                    width: 120 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.blue,
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4 * h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16 * w),
                                    height: 14 * h,
                                    width: 130 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.blue,
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4 * h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16 * w),
                                    height: 14 * h,
                                    width: 80 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.blue,
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10 * h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16 * w),
                                    height: 30 * h,
                                    width: 120 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.blue,
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 24 * h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 12 * w,
                    ),
                    Text(
                      "Полезные статьи",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 * o,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const UsefulArticleScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Все",
                        style: TextStyle(
                          color: AppTheme.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12 * w,
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: homeBloc.fetchChoice,
                builder: (context, AsyncSnapshot<ChoiceModel> snapshot) {
                  if (snapshot.hasData) {
                    List<ChoiceResult> choiceResult = snapshot.data!.results;
                    return Container(
                      height: 108 * h,
                      margin: EdgeInsets.only(top: 16 * h, bottom: 16 * h),
                      width: MediaQuery.of(context).size.width,
                      child: choiceResult.isEmpty
                          ? const CircularProgressIndicator()
                          : ListView.builder(
                              padding: const EdgeInsets.only(left: 16),
                              scrollDirection: Axis.horizontal,
                              itemCount: choiceResult.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom,
                                            ),
                                            height: 600 * h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(24 * w),
                                                topRight:
                                                    Radius.circular(24 * w),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0)),
                                                      height: 260 * h,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          24 *
                                                                              o),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          24 *
                                                                              o)),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                choiceResult[
                                                                        index]
                                                                    .image,
                                                            height: 260 * h,
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 12 * h,
                                                          right: 16 * w),
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: SvgPicture.asset(
                                                            "assets/icons/stack.svg"),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 19 * h,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 16 * w,
                                                        ),
                                                        Text(
                                                          choiceResult[index]
                                                              .createdAt
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 13 * o,
                                                            color:
                                                                AppTheme.grey2,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 16 * w,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3 * h,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  16 * w),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              32 * w,
                                                      child: Text(
                                                        choiceResult[index]
                                                            .title,
                                                        style: TextStyle(
                                                          color: AppTheme.dark,
                                                          fontSize: 17 * o,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 26 * h,
                                                ),
                                                Container(
                                                  height: 200 * h,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 16 * w),
                                                  child: Text(
                                                    choiceResult[index].body,
                                                    maxLines: 15,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: AppTheme.dark,
                                                      fontSize: 17 * o,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    height: 108 * h,
                                    margin: EdgeInsets.only(right: 12 * w),
                                    width: MediaQuery.of(context).size.width +
                                        26 * w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.08),
                                          blurRadius: 2 * o,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 0),
                                        ),
                                        BoxShadow(
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.08),
                                          blurRadius: 2 * o,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 108 * o,
                                          width: 108 * o,
                                          child: CachedNetworkImage(
                                            imageUrl: choiceResult[index].image,
                                            fit: BoxFit.cover,
                                            height: 108 * o,
                                            width: 108 * o,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10 * w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                choiceResult[index].title,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: AppTheme.grey2,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11 * o,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 32 * h,
                                                width: 163 * w,
                                                child: Text(
                                                  choiceResult[index].body,
                                                  style: TextStyle(
                                                    color: AppTheme.dark,
                                                    fontSize: 13 * o,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: AppTheme.shimmerBaseColor,
                    highlightColor: AppTheme.shimmerHighColor,
                    child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 16 * w),
                          height: 154 * h,
                          width: 311 * w,
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
            ],
          ),
        ],
      ),
    );
  }
}
