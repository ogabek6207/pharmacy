import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/card_model.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/ui/checkout/self_call_screen.dart';
import 'package:pharmacy/src/widget/card_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  initState() {
    homeBloc.getDrugsCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder(
      stream: homeBloc.fetchCardDrugs,
      builder: (context, AsyncSnapshot<List<DrugsResult>> snapshot) {
        if (snapshot.hasData) {
          List<DrugsResult> drugsRersult = snapshot.data!;
          return Scaffold(
            backgroundColor: AppTheme.white,
            appBar: AppBar(
              elevation: 1 * h,
              backgroundColor: AppTheme.white,
              title: SizedBox(
                height: 44 * h,
                width: 80 * w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8 * h,
                    ),
                    Text(
                      "Корзина",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 16 * o,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      drugsRersult.length.toString() + " товаров",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13 * o,
                        color: AppTheme.grey2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: drugsRersult.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                                              imageUrl:
                                                  drugsRersult[index].image,
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
                                                            BorderRadius
                                                                .circular(
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
                                                  color:
                                                      const Color(0xFF1C1C1E),
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
                                                drugsRersult[index].basePrice !=
                                                        0
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
                                                drugsRersult[index].cardCount ==
                                                        0
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
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5 * w),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                AppTheme.blue,
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
                                                                style:
                                                                    TextStyle(
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
                                                        decoration:
                                                            BoxDecoration(
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
                                                                  color:
                                                                      AppTheme
                                                                          .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10 *
                                                                              o),
                                                                ),
                                                                child:
                                                                    const Icon(
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
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      AppTheme
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
                                                                  color:
                                                                      AppTheme
                                                                          .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10 *
                                                                              o),
                                                                ),
                                                                child:
                                                                    const Icon(
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
                                                  child:
                                                      drugsRersult[index].favSelected
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
                          SizedBox(
                            height: 24 * h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 16 * w,
                              ),
                              Text(
                                "Ваша корзина",
                                style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 20 * o,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * h,
                          ),
                          CardWidget(
                            data: CardModel(
                              text: "Количество товаров, шт",
                              price: "3",
                            ),
                          ),
                          CardWidget(
                            data: CardModel(
                              text: "Товары на сумму",
                              price: "50 000 сум",
                            ),
                          ),
                          CardWidget(
                            data: CardModel(
                              text: "Скидка",
                              price: "-10 000 сум (20%)",
                            ),
                          ),
                          SizedBox(
                            height: 16 * h,
                          ),
                          CardWidget(
                            data: CardModel(
                              text: "Итого",
                              price: "40 000 сум",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const SelfCallScreen();
                                }),
                              );
                            },
                            child: Container(
                              height: 44 * h,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal: 12 * w,
                                vertical: 36 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.blue1,
                                borderRadius: BorderRadius.circular(10 * o),
                              ),
                              child: Center(
                                child: Text(
                                  "Перейти к оформлению",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 17 * o,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          );
        }
        return Column(
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
        );
      },
    );
  }
}
