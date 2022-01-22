import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/item_list_bloc.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/widget/search_widget.dart';

class ItemListScreen extends StatefulWidget {
  final String catalogName;
  final int catalogId;

  const ItemListScreen({
    Key? key,
    required this.catalogName,
    required this.catalogId,
  }) : super(key: key);

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  initState() {
    itemListBloc.getDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder(
      stream: itemListBloc.fetchItemList,
      builder: (context, AsyncSnapshot<DrugsModel> snapshot) {
        if (snapshot.hasData) {
          List<DrugsResult> drugsRersult = snapshot.data!.results;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppTheme.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: const Color(0xFF3F8AE0),
                  size: 24 * o,
                ),
              ),
              title: SizedBox(
                height: 44 * h,
                child: Column(
                  children: [
                    Text(
                      widget.catalogName,
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 17 * o,
                      ),
                    ),
                    Text(
                      drugsRersult.length.toString() + " товаров",
                      style: TextStyle(
                        color: AppTheme.grey2,
                        fontSize: 13 * h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: AppTheme.white,
            body: Column(
              children: [
                SearchWidget(
                  width: 24 * w,
                ),
                SizedBox(
                  height: 50 * h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50 * h,
                        width: 179 * w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 28 * w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/plest.svg",
                              color: AppTheme.blue,
                            ),
                            SizedBox(
                              width: 14 * w,
                            ),
                            Text(
                              "По названию",
                              style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 15 * o,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 32 * h,
                        width: 1 * w,
                        color: AppTheme.black.withOpacity(0.08),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50 * h,
                        width: 180 * w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 28 * w,
                            ),
                            GestureDetector(
                              onTap: () {
                                bool one = true,
                                    two = false,
                                    three = false,
                                    four = false,
                                    five = false;
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setstate) {
                                        return Container(
                                          height: 292 * h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.only(
                                            bottom: 42 * h,
                                            left: 8 * w,
                                            right: 8 * w,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: AppTheme.white,
                                            border: Border.all(
                                              color: AppTheme.black
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 12 * h,
                                              ),
                                              Row(
                                                children: [
                                                  const Spacer(),
                                                  Container(
                                                    height: 4 * h,
                                                    width: 59 * w,
                                                    decoration: BoxDecoration(
                                                      color: AppTheme.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16 * h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setstate(() {
                                                    one = true;
                                                    two = false;
                                                    three = false;
                                                    four = false;
                                                    five = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: 44 * h,
                                                  margin: const EdgeInsets.only(
                                                      left: 16),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10 * o),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "По названиею (Я-А)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppTheme.black,
                                                          fontSize: 15 * o,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      one
                                                          ? SvgPicture.asset(
                                                              "assets/icons/radio.svg")
                                                          : SvgPicture.asset(
                                                              "assets/icons/radio1.svg"),
                                                      SizedBox(
                                                        width: 25 * w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.5 * h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12 * w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: AppTheme.black
                                                    .withOpacity(0.08),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setstate(() {
                                                    one = false;
                                                    two = true;
                                                    three = false;
                                                    four = false;
                                                    five = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: 44 * h,
                                                  margin: const EdgeInsets.only(
                                                      left: 16),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10 * o),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "По названиею (Я-А)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppTheme.black,
                                                          fontSize: 15 * o,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      two
                                                          ? SvgPicture.asset(
                                                              "assets/icons/radio.svg")
                                                          : SvgPicture.asset(
                                                              "assets/icons/radio1.svg"),
                                                      SizedBox(
                                                        width: 25 * w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.5 * h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12 * w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: AppTheme.black
                                                    .withOpacity(0.08),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setstate(() {
                                                    one = false;
                                                    two = false;
                                                    three = true;
                                                    four = false;
                                                    five = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: 44 * h,
                                                  margin: EdgeInsets.only(
                                                      left: 16 * w),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "По цене (по возрастанию)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppTheme.black,
                                                          fontSize: 15 * o,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      three
                                                          ? SvgPicture.asset(
                                                              "assets/icons/radio.svg")
                                                          : SvgPicture.asset(
                                                              "assets/icons/radio1.svg"),
                                                      SizedBox(
                                                        width: 25 * w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.5 * h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12 * w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: AppTheme.black
                                                    .withOpacity(0.08),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setstate(() {
                                                    one = false;
                                                    two = false;
                                                    three = false;
                                                    four = true;
                                                    five = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: 44 * h,
                                                  margin: const EdgeInsets.only(
                                                      left: 16),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "По цене (по убыванию)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppTheme.black,
                                                          fontSize: 15 * o,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      four
                                                          ? SvgPicture.asset(
                                                              "assets/icons/radio.svg")
                                                          : SvgPicture.asset(
                                                              "assets/icons/radio1.svg"),
                                                      SizedBox(
                                                        width: 25 * w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.5 * h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12 * w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: AppTheme.black
                                                    .withOpacity(0.08),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setstate(() {
                                                    one = false;
                                                    two = false;
                                                    three = false;
                                                    four = false;
                                                    five = true;
                                                  });
                                                },
                                                child: Container(
                                                  height: 44 * h,
                                                  margin: EdgeInsets.only(
                                                      left: 16 * w),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10 * o),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "По наличию скидки",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppTheme.black,
                                                          fontSize: 15 * o,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      five
                                                          ? SvgPicture.asset(
                                                              "assets/icons/radio.svg")
                                                          : SvgPicture.asset(
                                                              "assets/icons/radio1.svg"),
                                                      SizedBox(
                                                        width: 25 * w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.5 * h,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12 * w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: AppTheme.black
                                                    .withOpacity(0.08),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: SvgPicture.asset(
                                "assets/icons/filter.svg",
                                color: AppTheme.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Фильтр",
                              style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 15 * o,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppTheme.black.withOpacity(0.08),
                ),
                drugsRersult.isEmpty
                    ? Column(
                        children: [
                          const Spacer(),
                          Row(
                            children: const [
                              Spacer(),
                              CircularProgressIndicator(),
                              Spacer(),
                            ],
                          ),
                          const Spacer(),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: drugsRersult.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 18 * h),
                                Row(
                                  children: [
                                    Container(
                                      height: 140 * o,
                                      width: 140 * o,
                                      decoration: const BoxDecoration(
                                        color: AppTheme.white,
                                      ),
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: drugsRersult[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                          drugsRersult[index].basePrice != 0
                                              ? Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 18 * h,
                                                    width: 42 * w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4 * w,
                                                            vertical: 2 * h),
                                                    decoration: BoxDecoration(
                                                      color: AppTheme.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9 * o),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "-" +
                                                            ((drugsRersult[index]
                                                                            .basePrice -
                                                                        drugsRersult[index]
                                                                            .price) *
                                                                    100 ~/
                                                                    drugsRersult[
                                                                            index]
                                                                        .basePrice)
                                                                .toString() +
                                                            "%",
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12 * w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12 * h,
                                          ),
                                          SizedBox(
                                            width: 183 * w,
                                            child: Text(
                                              drugsRersult[index].name,
                                              style: TextStyle(
                                                color: const Color(0xFF1C1C1E),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13 * o,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4 * h,
                                          ),
                                          Text(
                                            drugsRersult[index].description,
                                            style: TextStyle(
                                              color: AppTheme.grey2,
                                              fontSize: 12 * o,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 11 * h,
                                          ),
                                          Row(
                                            children: [
                                              Text(drugsRersult[index]
                                                      .price
                                                      .toString() +
                                                  " sum"),
                                              SizedBox(
                                                width: 12 * w,
                                              ),
                                              drugsRersult[index].basePrice != 0
                                                  ? Text(
                                                      drugsRersult[index]
                                                              .basePrice
                                                              .toString() +
                                                          " sum",
                                                      style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12 * h,
                                          ),
                                          Row(
                                            children: [
                                              drugsRersult[index].cardCount == 0
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          drugsRersult[index]
                                                              .cardCount = 1;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 30 * h,
                                                        width: 120 * w,
                                                        margin: EdgeInsets.only(
                                                            left: 5 * w),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppTheme.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10 * o),
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "add to cart",
                                                              style: TextStyle(
                                                                color: AppTheme
                                                                    .white,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 8 * w,
                                                            ),
                                                            SvgPicture.asset(
                                                                "assets/icons/basket.svg")
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 30 * h,
                                                      width: 120 * w,
                                                      decoration: BoxDecoration(
                                                        color: AppTheme.blue
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10 * o),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                drugsRersult[
                                                                        index]
                                                                    .cardCount--;
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 26 * o,
                                                              width: 26 * o,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppTheme
                                                                    .blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10 *
                                                                                o),
                                                              ),
                                                              child: const Icon(
                                                                Icons.remove,
                                                                color: AppTheme
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Center(
                                                            child: Text(
                                                              drugsRersult[
                                                                          index]
                                                                      .cardCount
                                                                      .toString() +
                                                                  " шт.",
                                                              style: TextStyle(
                                                                color: AppTheme
                                                                    .blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    15 * o,
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                drugsRersult[
                                                                        index]
                                                                    .cardCount++;
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 26 * o,
                                                              width: 26 * o,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppTheme
                                                                    .blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10 *
                                                                                o),
                                                              ),
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    drugsRersult[index]
                                                            .favSelected =
                                                        !drugsRersult[index]
                                                            .favSelected;
                                                  });
                                                },
                                                child: drugsRersult[index]
                                                        .favSelected
                                                    ? SvgPicture.asset(
                                                        "assets/icons/like.svg",
                                                        height: 24 * o,
                                                        width: 24 * o,
                                                      )
                                                    : SvgPicture.asset(
                                                        "assets/icons/dislike.svg",
                                                        height: 24 * o,
                                                        width: 24 * o,
                                                      ),
                                              ),
                                              SizedBox(
                                                width: 17 * w,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        }
        return const Scaffold(
          backgroundColor: AppTheme.white,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
