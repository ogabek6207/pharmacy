import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/ui/dialog/bottom_dialog.dart';

import 'courier/courier_screen.dart';

class ByCourierScreen extends StatefulWidget {
  const ByCourierScreen({Key? key}) : super(key: key);

  @override
  _ByCourierScreenState createState() => _ByCourierScreenState();
}

class _ByCourierScreenState extends State<ByCourierScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    bool one = false;
    bool two = false;
    bool three = false;

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.blue,
            size: 24 * o,
          ),
        ),
        elevation: 0,
        backgroundColor: AppTheme.white,
        title: Text(
          "Оформление заказа",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17 * o,
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              Text(
                "Способ получения",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20 * o,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 36 * h,
                  width: MediaQuery.of(context).size.width / 2 - 48 * w,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    border: Border.all(color: AppTheme.grey4, width: 1.5),
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      Text(
                        "Самовызов",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 13 * o,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 36 * h,
                width: MediaQuery.of(context).size.width / 2 - 48 * w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppTheme.blue3, width: 1.5),
                  borderRadius: BorderRadius.circular(10 * o),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    Text(
                      "Курьером",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 13 * o,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 200 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: o,
                  blurRadius: 24 * o,
                  offset: const Offset(0, 2),
                  color: AppTheme.black.withOpacity(0.08),
                ),
                BoxShadow(
                  spreadRadius: o,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                  color: AppTheme.black.withOpacity(0.08),
                ),
              ],
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    Text(
                      "Самовызов",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 17 * o,
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
                      "3 товаров",
                      style: TextStyle(
                        color: AppTheme.grey2,
                        fontSize: 13 * o,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Редактировать",
                      style: TextStyle(
                        color: AppTheme.blue,
                        fontSize: 13 * o,
                      ),
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    Image.asset(
                      "assets/images/checkout.png",
                      height: 64 * o,
                      width: 64 * o,
                    ),
                    Image.asset(
                      "assets/images/checkout1.png",
                      height: 64 * o,
                      width: 64 * o,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16 * h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const CourierScreen();
                      }),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    height: 30 * h,
                    width: 132 * w,
                    decoration: BoxDecoration(
                      color: AppTheme.blue,
                      borderRadius: BorderRadius.circular(10 * o),
                    ),
                    child: Center(
                      child: Text(
                        "Выберите адрес",
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 12 * o,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                "Ваши данные",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20 * o,
                ),
              ),
              const Spacer(),
              Text(
                "Редактировать",
                style: TextStyle(
                  color: AppTheme.blue,
                  fontSize: 13 * o,
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
                    width: 16 * w,
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
                      fontSize: 13 * o,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              Text(
                "Промокод",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20 * o,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 60 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3F5),
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 16 * w,
                        ),
                        Text(
                          "Промокод",
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
                          "Используйте только 1 промокод",
                          style: TextStyle(
                            color: AppTheme.grey2,
                            fontSize: 13 * o,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/icon.svg",
                  height: 36 * o,
                  width: 36 * o,
                ),
                SizedBox(
                  width: 12 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              Text(
                "Тип оплаты",
                style: TextStyle(
                  fontSize: 20 * o,
                  color: AppTheme.dark,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  one = true;
                  two = false;
                  three = false;
                },
              );
            },
            child: SizedBox(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  one
                      ? SvgPicture.asset("assets/icons/radio.svg")
                      : SvgPicture.asset("assets/icons/radio1.svg"),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Наличные",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15 * o,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  one = false;
                  two = true;
                  three = false;
                },
              );
            },
            child: SizedBox(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  two
                      ? SvgPicture.asset("assets/icons/radio.svg")
                      : SvgPicture.asset("assets/icons/radio1.svg"),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "8600 •••• •••• 3285",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15 * o,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  one = false;
                  two = false;
                  three = true;
                },
              );
            },
            child: SizedBox(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  three
                      ? SvgPicture.asset("assets/icons/radio.svg")
                      : SvgPicture.asset("assets/icons/radio1.svg"),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Добавить карту",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15 * o,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
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
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
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
          Container(
            height: 34 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Row(
              children: [
                Text(
                  "Доставка",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
                const Spacer(),
                Text(
                  "0 сум",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13 * o,
                  ),
                ),
                SizedBox(
                  height: 8 * h,
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
            child: Row(
              children: [
                Text(
                  "*При заказе более 150 000 сум доставка бесплатно",
                  style: TextStyle(
                    color: AppTheme.blue,
                    fontSize: 11 * o,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 1 * h,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),
          ),
          SizedBox(
            height: 12 * h,
          ),
          GestureDetector(
            onTap: () {
              BottomDialog.PayDialog(context);
            },
            child: Container(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Оплатить",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 17 * o,
                  ),
                ),
              ),
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
