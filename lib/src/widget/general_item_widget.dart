import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "package:http/http.dart" as prep;
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/model/item_model.dart';


class ItemGeneralWidget extends StatefulWidget {
  final ItemModel data;

  const ItemGeneralWidget({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ItemGeneralWidgetState createState() => _ItemGeneralWidgetState();
}

class _ItemGeneralWidgetState extends State<ItemGeneralWidget> {
  List<DrugsResult> data = [];
  @override
  initState() {
    _getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Row(
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: const BoxDecoration(
                color: AppTheme.white,
              ),
              child: Stack(
                children: [
                 CachedNetworkImage(imageUrl: widget.data.image,),
                  widget.data.basePrice != 0
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 18,
                            width: 42,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.red,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Text(
                                "-"+((widget.data.basePrice - widget.data.price) *
                                        100 ~/
                                        widget.data.basePrice)
                                    .toString()+"%",
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 183,
                    child: Text(
                     widget.data.name,
                      style: const TextStyle(
                        color: Color(0xFF1C1C1E),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.data.manifacturer,
                    style: const TextStyle(
                      color: AppTheme.grey2,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Text(widget.data.price.toString() + " sum"),
                      const SizedBox(
                        width: 12,
                      ),
                      widget.data.basePrice != 0
                          ? Text(
                              widget.data.basePrice.toString() + " sum",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      widget.data.cardCount == 0
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.data.cardCount = 1;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                margin: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  color: AppTheme.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "add to cart",
                                      style: TextStyle(
                                        color: AppTheme.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset("assets/icons/basket.svg")
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: AppTheme.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.data.cardCount--;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: AppTheme.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: Text(
                                      widget.data.cardCount.toString() + " шт.",
                                      style: const TextStyle(
                                        color: AppTheme.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.data.cardCount++;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: AppTheme.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
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
                            widget.data.favSelected = !widget.data.favSelected;
                          });
                        },
                        child: widget.data.favSelected
                            ? SvgPicture.asset(
                                "assets/icons/like.svg",
                                height: 24,
                                width: 24,
                              )
                            : SvgPicture.asset(
                                "assets/icons/dislike.svg",
                                height: 24,
                                width: 24,
                              ),
                      ),
                      const SizedBox(
                        width: 17,
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
  }
  Future<void> _getData() async {
    String url = "https://api.gopharm.uz/api/v1/drugs";
    print(url);
    prep.Response response = await prep.get(
      Uri.parse(url),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var info = json.decode(utf8.decode(response.bodyBytes));
      DrugsModel drugsresult = DrugsModel.fromJson(info);

      setState(() {
        data = drugsresult.results;
      });
    } else {
      ///error
    }
  }
}
