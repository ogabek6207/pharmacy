import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class CourierDeliveryAfterScreen extends StatefulWidget {
  const CourierDeliveryAfterScreen({Key? key}) : super(key: key);

  @override
  _CourierDeliveryAfterScreenState createState() =>
      _CourierDeliveryAfterScreenState();
}

class _CourierDeliveryAfterScreenState
    extends State<CourierDeliveryAfterScreen> {
  bool one = false;
  bool two = false;
  bool one1 = false;
  bool two1 = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            size: 24 * o,
            color: AppTheme.blue,
          ),
        ),
        title: Text(
          "Курьеркая доставка",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17 * o,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16 * h,
              ),
              Text(
                "Адрес доставки",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 20 * o,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                one = true;
                two = false;
              });
            },
            child: Container(
              height: 40 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16 * w),
              child: Row(
                children: [
                  one
                      ? SvgPicture.asset(
                          "assets/icons/radio.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/radio1.svg",
                        ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ташкент, ул.Ахмад Даниш, 24, кв. 48,",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15 * o,
                        ),
                      ),
                      Text(
                        "эт. 3, подъезд 2",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15 * o,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24 * h),
          GestureDetector(
            onTap: () {
              setState(() {
                one = false;
                two = true;
              });
            },
            child: Container(
              height: 40 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16 * w),
              child: Row(
                children: [
                  two
                      ? SvgPicture.asset(
                          "assets/icons/radio.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/radio1.svg",
                        ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ташкент, ул.Ахмад Даниш, 24, кв. 48,",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15 * o,
                        ),
                      ),
                      Text(
                        "эт. 3, подъезд 2",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15 * o,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8 * w),
            color: AppTheme.black.withOpacity(0.08),
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 24 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/icon_plus.svg"),
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Добавить новый адрес",
                  style: TextStyle(
                    color: AppTheme.blue,
                    fontSize: 15 * o,
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
                "Время доставки",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 20 * o,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24 * h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                one1 = true;
                two1 = false;
              });
            },
            child: Container(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  one1
                      ? SvgPicture.asset(
                          "assets/icons/radio.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/radio1.svg",
                        ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "В течение часа 1км = 2000 сум",
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
              setState(() {
                one1 = false;
                two1 = true;
              });
            },
            child: Container(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  two1
                      ? SvgPicture.asset(
                          "assets/icons/radio.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/radio1.svg",
                        ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "В течение 24 часа (Бесплатно)",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15 * o,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            height: 44 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * o),
              color: AppTheme.blue,
            ),
            child: Center(
              child: Text(
                "Далее",
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 17 * o,
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
