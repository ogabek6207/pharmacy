
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/ui/dialog/bottom_dialog.dart';

import '../by_courier_screen.dart';
import 'courier_delivery_screen.dart';

class SelfCallAfterScreen extends StatefulWidget {
  const SelfCallAfterScreen({Key? key}) : super(key: key);

  @override
  _SelfCallAfterScreenState createState() => _SelfCallAfterScreenState();
}

class _SelfCallAfterScreenState extends State<SelfCallAfterScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,
          size: 24*o,),
        ),
        elevation: 0,
        backgroundColor: AppTheme.white,
        title: const Text(
          "Оформление заказа",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Text(
                "Способ получения",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                height: 36,
                width: MediaQuery.of(context).size.width / 2 - 48,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppTheme.blue3, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Самовызов",
                      style: TextStyle(
                        color: AppTheme.dark,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ByCourierScreen();
                  }));
                },
                child: Container(
                  height: 36,
                  width: MediaQuery.of(context).size.width / 2 - 48,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    border: Border.all(color: AppTheme.grey4, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Курьером",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 344 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: o,
                  blurRadius: 24,
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                     SizedBox(
                      width: 16*w,
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
                SizedBox(height: 24*h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 16*w,
                        ),
                        Text(
                          "Ташкент, ул.Ахмад Даниш, 24 ",
                          style: TextStyle(
                            color: AppTheme.dark,
                            fontSize: 13*o,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                         SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Сегодня, 08:00 - 22:00",
                          style: TextStyle(
                            color: AppTheme.dark,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16*h,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CourierDeliveryScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    height: 30,
                    width: 176,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.blue,width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Изменить адрес и время",
                        style: TextStyle(
                          color: AppTheme.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16*h,),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16*w),
                  color: AppTheme.black.withOpacity(0.08),
                ),
                SizedBox(
                  height: 16*h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    const Text(
                      "3 товаров",
                      style: TextStyle(
                        color: AppTheme.grey2,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Редактировать",
                      style: TextStyle(
                        color: AppTheme.blue,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
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
                const SizedBox(
                  height: 16,
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              const Text(
                "Ваши данные",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              const Text(
                "Изменить",
                style: TextStyle(
                  color: AppTheme.blue,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Азиза Умарова",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Имя",
                    style: TextStyle(
                      color: AppTheme.grey2,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "+998 99 001 92 83",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Номер телефона",
                    style: TextStyle(
                      color: AppTheme.grey2,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * w,
              ),
              const Text(
                "Промокод",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Промокод",
                          style: TextStyle(
                            color: AppTheme.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Используйте только 1 промокод",
                          style: TextStyle(
                            color: AppTheme.grey2,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/icon.svg",
                  height: 36,
                  width: 36,
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Text(
                "Тип оплаты",
                style: TextStyle(
                  fontSize: 20,
                  color: AppTheme.dark,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/radio1.svg"),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "Наличные",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/radio1.svg"),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "8600 •••• •••• 3285",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/icons/radio1.svg"),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "Добавить карту",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrow_right.svg",
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 34,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "Количество товаров, шт",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  "3",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 34,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "Товары на сумму",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  "50 000 сум",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 34,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "Доставка",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  "0 сум",
                  style: TextStyle(
                    color: AppTheme.grey2,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 34,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "Итого",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                Text(
                  "50 000 сум",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),
          ),
          const SizedBox(
            height: 12,
          ),


          GestureDetector(
            onTap: (){
              BottomDialog.PayDialog(context);
            },
            child: Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Оформить заказ",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 44,
          ),
        ],
      ),
    );
  }
}
