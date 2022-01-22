import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/ui/checkout/courier/by_courier_after_screen.dart';
import 'package:pharmacy/src/ui/checkout/order_screen.dart';
import 'package:pharmacy/src/widget/horizontal_item_widget.dart';
import 'package:pharmacy/src/widget/open_widget.dart';

class BottomDialog {
  static void drugsDialog(
    BuildContext context,
    DrugsResult data,
    List<DrugsResult> info,
  ) {
    bool like = false;
    bool c = true;
    bool k = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double h = Utils.windowHeight(context);
            double w = Utils.windowWidth(context);
            double o = (h + w) / 2;
            return Container(
              margin: EdgeInsets.only(
                  top: 54 * h,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10 * o),
                  topRight: Radius.circular(10 * o),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16 * h),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/dismiss.svg",
                          height: 24 * o,
                          width: 24 * o,
                        ),
                      ),
                      SizedBox(width: 16 * w),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              height: 240 * o,
                              width: 240 * o,
                              child: CachedNetworkImage(
                                imageUrl: data.image,
                                height: 240 * o,
                                width: 240 * o,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Spacer(),
                          ],
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
                              data.name,
                              style: TextStyle(
                                color: AppTheme.blue,
                                fontSize: 12 * o,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  like = !like;
                                });
                              },
                              child: like
                                  ? SvgPicture.asset("assets/icons/like.svg")
                                  : SvgPicture.asset(
                                      "assets/icons/dislike.svg"),
                            ),
                            SizedBox(
                              width: 18 * w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8 * h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 16 * w,
                              child: Text(
                                data.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 20 * o,
                                ),
                              ),
                            ),
                          ],
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
                              data.price.toString(),
                              style: TextStyle(
                                color: AppTheme.red,
                                fontSize: 24 * o,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 12 * w,
                            ),
                            Text(
                              data.basePrice.toString(),
                              style: TextStyle(
                                color: AppTheme.grey2,
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * o,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 44 * h,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 40 * h,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 16 * w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * o),
                                color: AppTheme.white1,
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        c = true;
                                        k = false;
                                      });
                                    },
                                    child: c
                                        ? Container(
                                            height: 32,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                25,
                                            margin: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppTheme.white,
                                              borderRadius:
                                                  BorderRadius.circular(10 * o),
                                              border: Border.all(
                                                color: AppTheme.black
                                                    .withOpacity(0.04),
                                                width: 0.5 * w,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Опасание",
                                                style: TextStyle(
                                                  color: AppTheme.blue,
                                                  fontSize: 13 * o,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 32 * o,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                22 * w,
                                            margin: EdgeInsets.only(
                                              top: 4 * h,
                                              bottom: 4 * h,
                                              left: 4 * w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppTheme.white1,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppTheme.black
                                                    .withOpacity(0.04),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Опасание",
                                                style: TextStyle(
                                                  color: AppTheme.blue,
                                                  fontSize: 13 * o,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        c = false;
                                        k = true;
                                      });
                                    },
                                    child: k
                                        ? Container(
                                            height: 32 * h,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                22 * w,
                                            margin: EdgeInsets.only(
                                              top: 4 * h,
                                              bottom: 4 * h,
                                              left: 4 * w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppTheme.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppTheme.black
                                                    .withOpacity(0.04),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Инструкции",
                                                style: TextStyle(
                                                  color: AppTheme.blue,
                                                  fontSize: 13 * o,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 32 * h,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                22 * h,
                                            margin: EdgeInsets.only(
                                              top: 4 * h,
                                              bottom: 4 * h,
                                              right: 4 * w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppTheme.white1,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppTheme.black
                                                    .withOpacity(0.04),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Инструкции",
                                                style: TextStyle(
                                                  color: AppTheme.blue,
                                                  fontSize: 13 * o,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        c
                            ? Column(
                                children: [
                                  Container(
                                    height: 60 * h,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 16, top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Дротаверин",
                                          style: TextStyle(
                                            color: AppTheme.black,
                                            fontSize: 16 * o,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4 * h,
                                        ),
                                        Text(
                                          "Действующее вещество",
                                          style: TextStyle(
                                            color: AppTheme.grey2,
                                            fontSize: 13 * o,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60 * h,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                      left: 16 * w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Капсулы",
                                          style: TextStyle(
                                            color: AppTheme.black,
                                            fontSize: 16 * o,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4 * h,
                                        ),
                                        Text(
                                          "Форма выпуска",
                                          style: TextStyle(
                                            color: AppTheme.grey2,
                                            fontSize: 13 * o,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60 * h,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                      left: 16 * w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Франция",
                                          style: TextStyle(
                                            color: AppTheme.black,
                                            fontSize: 16 * o,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4 * h,
                                        ),
                                        Text(
                                          "Страна происхождения",
                                          style: TextStyle(
                                            color: AppTheme.grey2,
                                            fontSize: 13 * o,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 12 * w,
                                      ),
                                      Text(
                                        "Рекомендуется к этому товару",
                                        style: TextStyle(
                                          color: AppTheme.dark,
                                          fontSize: 20 * o,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 12),
                                    height: 280 * h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: info.length,
                                      itemBuilder: (context, index) {
                                        return ItemHorizontalWidget(
                                            data: info[index]);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 28 * h,
                                  ),
                                ],
                              )
                            : const OpenWidget(),
                        Row(
                          children: [
                            SizedBox(
                              width: 12 * w,
                            ),
                            Text(
                              "Аналоги",
                              style: TextStyle(
                                color: AppTheme.dark,
                                fontSize: 20 * o,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 280 * h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: info.length,
                            itemBuilder: (context, index) {
                              return ItemHorizontalWidget(data: info[index]);
                            },
                          ),
                        ),
                        SizedBox(height: 24 * h),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: AppTheme.black.withOpacity(0.08),
                        ),
                        SizedBox(height: 24 * h),
                        data.cardCount <= 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data.cardCount++;
                                  });
                                },
                                child: Container(
                                  height: 44,
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 12 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "В Корзину",
                                      style: TextStyle(
                                        color: AppTheme.dark,
                                        fontSize: 20 * o,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  SizedBox(width: 12 * w),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        data.cardCount--;
                                      });
                                    },
                                    child: Container(
                                      height: 36 * o,
                                      width: 36 * o,
                                      decoration: BoxDecoration(
                                        color: AppTheme.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: Text(
                                      data.cardCount.toString() + " шт.",
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
                                        data.cardCount++;
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
                                  SizedBox(width: 12 * w),
                                ],
                              ),
                        SizedBox(height: 40 * h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  static void MapDialog(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double h = Utils.windowHeight(context);
            double w = Utils.windowWidth(context);
            double o = (h + w) / 2;
            return Container(
              height: 304,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 8 * w,
                vertical: 40 * h,
              ),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(18 * o),
                border: Border.all(color: AppTheme.black, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                    color: AppTheme.black.withOpacity(0.08),
                  ),
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                    color: AppTheme.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 12 * h),
                    height: 4 * h,
                    width: 60 * w,
                    decoration: BoxDecoration(
                      color: AppTheme.grey,
                      borderRadius: BorderRadius.circular(100 * o),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                  SizedBox(
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12 * w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ул. Ахмад Даниш 3А",
                              style: TextStyle(
                                color: AppTheme.dark,
                                fontSize: 15 * o,
                              ),
                            ),
                            Text(
                              "Адрес",
                              style: TextStyle(
                                color: AppTheme.grey2,
                                fontSize: 13 * o,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/icons/dislike.svg",
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24 * w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12 * w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "08:00 - 22:00",
                              style: TextStyle(
                                color: AppTheme.dark,
                                fontSize: 15 * o,
                              ),
                            ),
                            Text(
                              "Режим работы",
                              style: TextStyle(
                                color: AppTheme.grey2,
                                fontSize: 13 * o,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24 * w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12 * w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "+998 99 004 84 82",
                              style: TextStyle(
                                color: AppTheme.dark,
                                fontSize: 15 * o,
                              ),
                            ),
                            Text(
                              "Телефон",
                              style: TextStyle(
                                color: AppTheme.grey2,
                                fontSize: 13 * o,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24 * w,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const SelfCallAfterScreen();
                        }),
                      );
                    },
                    child: Container(
                      height: 44 * h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16 * w),
                      decoration: BoxDecoration(
                        color: AppTheme.blue,
                        borderRadius: BorderRadius.circular(10 * o),
                      ),
                      child: Center(
                        child: Text(
                          "Забрать отсюда",
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 17 * o,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * h,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  static Future<void> PayDialog(
    BuildContext context,
  ) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              double h = Utils.windowHeight(context);
              double w = Utils.windowWidth(context);
              double o = (h + w) / 2;
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 42 * h,
                  horizontal: 8 * w,
                ),
                height: 420 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(18 * o),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12 * h),
                      height: 4 * h,
                      width: 60 * w,
                      decoration: BoxDecoration(
                        color: AppTheme.grey,
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                    SizedBox(
                      height: 16 * h,
                    ),
                    Image.asset(
                      "assets/images/done1.png",
                      height: 152 * h,
                      width: 152 * w,
                    ),
                    SizedBox(
                      height: 8 * h,
                    ),
                    Text(
                      "Ваш заказ оформлен",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 17 * o,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8 * h,
                    ),
                    Container(
                      height: 54 * h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 64 * w),
                      child: Text(
                        "Изменение статуса заказа вы можетеотслижовать в вашем профиле",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.grey2,
                          fontSize: 13 * o,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8 * h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const OrderScreen();
                          }),
                        );
                      },
                      child: Container(
                        height: 44 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * o),
                          border: Border.all(
                            color: AppTheme.blue3,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Посмотреть детали заказа",
                            style: TextStyle(
                              color: AppTheme.blue3,
                              fontSize: 17 * o,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 * h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 44 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          color: AppTheme.blue3,
                          borderRadius: BorderRadius.circular(10 * o),
                          border: Border.all(
                            color: AppTheme.blue3,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Закрыть",
                            style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 17 * o,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 * h,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
