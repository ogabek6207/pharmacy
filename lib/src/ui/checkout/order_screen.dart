import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.blue3,
            size: 24 * o,
          ),
        ),
        elevation: 1,
        backgroundColor: AppTheme.white,
        title: Column(
          children: [
            Text(
              "Заказ №00029323",
              style: TextStyle(
                color: AppTheme.dark,
                fontSize: 17 * o,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "от 26 июня",
              style: TextStyle(
                color: AppTheme.grey2,
                fontSize: 13 * o,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 24 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              Text(
                "Ваши данные",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20 * o,
                ),
              ),
              SizedBox(
                width: 16 * w,
              ),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Азиза Умарова",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 16 * o,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16 * o,
                  ),
                  Text(
                    "Имя",
                    style: TextStyle(
                      color: AppTheme.grey2,
                      fontSize: 13 * o,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16 * h,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "+998 99 001 92 83",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 16 * o,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Номер телефона",
                    style: TextStyle(
                      color: AppTheme.grey2,
                      fontSize: 13 * w,
                    ),
                  ),
                ],
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
                "Oплата",
                style: TextStyle(
                  fontSize: 20 * o,
                  color: AppTheme.dark,
                ),
              ),
              const Spacer(),
              SvgPicture.asset("assets/icons/money.svg"),
              SizedBox(
                width: 8 * w,
              ),
              Text(
                "Наличными",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13 * o,
                ),
              ),
              SizedBox(
                width: 16 * w,
              ),
            ],
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * h),
            child: Row(
              children: [
                Text(
                  "Количество товаров, шт",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
                const Spacer(),
                Text(
                  "3",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Товары на сумму",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
                const Spacer(),
                Text(
                  "50 000 сум",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
          ),
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Row(
              children: [
                Text(
                  "Итого",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15 * o,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  "50 000 сум",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15 * o,
                  ),
                ),
                SizedBox(
                  height: 8 * h,
                ),
              ],
            ),
          ),
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
          ),
          Container(
            height: 292 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(10 * o),
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
                SizedBox(
                  height: 16 * h,
                ),
                Container(
                  height: 24 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Самовызов",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 20 * o,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 22 * h,
                        width: 64 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.blue3,
                          borderRadius: BorderRadius.circular(4 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Создан",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11 * o,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    Text(
                      "Адрес аптеки",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 15 * o,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4 * h,
                ),
                Container(
                  height: 40 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ташкент, ул.Ахмад Даниш, 24 ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 13 * h,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        " Сегодня, 08:00 - 22:00",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 13 * h,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12 * h,
                ),
                Container(
                  height: 0.5 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  color: AppTheme.black.withOpacity(0.08),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  child: Row(
                    children: [
                      Image.asset("assets/images/dori13.png"),
                      SizedBox(
                        width: 12 * w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "АЙФЛОКС каплиглазные 0,3% 5 мл №30 ",
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 11 * o,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "блистер",
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 11 * o,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 4 * h,
                          ),
                          Row(
                            children: [
                              Text(
                                "39 000 сум ",
                                style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 15 * o,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "х 2",
                                style: TextStyle(
                                  color: AppTheme.grey1,
                                  fontSize: 15 * o,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12 * h,
                ),
                Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  child: Row(
                    children: [
                      Image.asset("assets/images/dori15.png"),
                      SizedBox(
                        width: 12 * w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Бифиформ капс. №30 ",
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 11 * o,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 4 * h,
                          ),
                          Row(
                            children: [
                              Text(
                                "11 000 сум",
                                style: TextStyle(
                                  color: AppTheme.dark,
                                  fontSize: 15 * o,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 44 * h,
          ),
        ],
      ),
    );
  }
}
