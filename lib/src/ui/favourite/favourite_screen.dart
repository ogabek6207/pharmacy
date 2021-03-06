import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  initState() {
    homeBloc.getDrugsFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder(
      stream: homeBloc.fetchFavDrugs,
      builder: (context, AsyncSnapshot<List<DrugsResult>> snapshot) {
        if (snapshot.hasData) {
          List<DrugsResult> drugsResult = snapshot.data!;
          print(drugsResult.length);
          return drugsResult.isEmpty
              ? Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        Lottie.asset(
                          "assets/lottie_files/box.json",
                          height: 300 * o,
                          width: 300 * o,
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                )
              : Scaffold(
                  appBar: AppBar(
                    elevation: 1,
                    backgroundColor: AppTheme.white,
                    title: SizedBox(
                      height: 44 * h,
                      child: Column(
                        children: [
                          Text(
                            "???????????? ??????????????????????",
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 17 * o,
                            ),
                          ),
                          Text(
                            drugsResult.length.toString() + " ??????????????",
                            style: TextStyle(
                              color: AppTheme.grey2,
                              fontSize: 13 * o,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: AppTheme.white,
                  body: ListView(
                    children: [
                      drugsResult.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Column(
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
                                )),
                              ],
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: drugsResult.length,
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
                                                    drugsResult[index].image,
                                              ),
                                              drugsResult[index].basePrice != 0
                                                  ? Positioned(
                                                      top: 0,
                                                      right: 0,
                                                      child: Container(
                                                        height: 18 * h,
                                                        width: 42 * w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    4 * w,
                                                                vertical:
                                                                    2 * h),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppTheme.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9 * 0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "-" +
                                                                ((drugsResult[index].basePrice -
                                                                            drugsResult[index]
                                                                                .price) *
                                                                        100 ~/
                                                                        drugsResult[index]
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
                                                  drugsResult[index].name,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF1C1C1E),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13 * o,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4 * o,
                                              ),
                                              Text(
                                                drugsResult[index].description,
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
                                                  Text(drugsResult[index]
                                                          .price
                                                          .toString() +
                                                      " sum"),
                                                  SizedBox(
                                                    width: 12 * w,
                                                  ),
                                                  drugsResult[index]
                                                              .basePrice !=
                                                          0
                                                      ? Text(
                                                          drugsResult[index]
                                                                  .basePrice
                                                                  .toString() +
                                                              " sum",
                                                          style:
                                                              const TextStyle(
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
                                                  drugsResult[index].cardCount ==
                                                      0
                                                      ? GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        drugsResult[index]
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
                                                              drugsResult[
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
                                                            drugsResult[
                                                            index]
                                                                .cardCount
                                                                .toString() +
                                                                " ????.",
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
                                                              drugsResult[
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
                                                      drugsResult[index].favSelected = !drugsResult[index].favSelected;
                                                      homeBloc.updateFavDrugs(drugsResult[index], drugsResult[index].favSelected);
                                                    },
                                                    child:
                                                    drugsResult[index].favSelected
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
                    ],
                  ),
                );
        }
        return Shimmer.fromColors(
          baseColor: AppTheme.shimmerBaseColor,
          highlightColor: AppTheme.shimmerHighColor,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 158 * h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 8 * w,
                  right: 8 * w,
                  top: 18 * o,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.blue,
                  borderRadius: BorderRadius.circular(10 * o),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
