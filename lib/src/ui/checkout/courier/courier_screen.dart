import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

import 'courier_delivery_after.dart';

class CourierScreen extends StatefulWidget {
  const CourierScreen({Key? key}) : super(key: key);

  @override
  _CourierScreenState createState() => _CourierScreenState();
}

class _CourierScreenState extends State<CourierScreen> {
  bool one = false;
  bool two = false;

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
        leading:  Icon(
          Icons.arrow_back_ios,
          size: 24*o,
          color: AppTheme.blue,
        ),
        title:  Text(
          "Курьеркая доставка",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17*o,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 16*h,
          ),
          Row(
            children:  [
              SizedBox(
                width: 16*w,
              ),
              Text(
                "Адрес доставки",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 20*o,
                ),
              ),
            ],
          ),
           SizedBox(
            height: 24*h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  const CourierDeliveryAfterScreen();
                  },
                ),
              );
            },
            child: Container(
              height: 24*h,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/icon_plus.svg"),
                   SizedBox(
                    width: 16*w,
                  ),
                   Text(
                    "Добавить новый адрес",
                    style: TextStyle(
                      color: AppTheme.blue,
                      fontSize: 15*o,
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: 24*h,
          ),
          Row(
            children:  [
              SizedBox(
                width: 16*w,
              ),
              Text(
                "Время доставки",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 20*o,
                ),
              ),
            ],
          ),
           SizedBox(
            height: 24*h,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                one = true;
                two = false;
              });
            },
            child: Container(
              height: 44*h,
              width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.symmetric(horizontal: 16*w),
              child: Row(
                children: [

                  one ?
                  SvgPicture.asset(
                    "assets/icons/radio.svg",
                  ) : SvgPicture.asset(
                    "assets/icons/radio1.svg",
                  ),
                  SizedBox(
                    width: 16*w,
                  ),
                   Text(
                    "В течение часа 1км = 2000 сум",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15*o,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                one = false;
                two = true;
              },);
            },
            child: Container(
              height: 44*h,
              width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.symmetric(horizontal: 16*w),
              child: Row(
                children: [
                  two ?
                  SvgPicture.asset(
                    "assets/icons/radio.svg",
                  ) : SvgPicture.asset(
                    "assets/icons/radio1.svg",
                  ),
                  SizedBox(
                    width: 16*w,
                  ),
                   Text(
                    "В течение 24 часа (Бесплатно)",
                    style: TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15*o,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 1*h,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),
          ),
           SizedBox(
            height: 12*h,
          ),
          Container(
            height: 44*h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12*w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10*o),
              color: AppTheme.blue,
            ),
            child:  Center(
              child: Text(
                "Далее",
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 17*o,
                ),
              ),
            ),
          ),
           SizedBox(
            height: 44*h,
          ),
        ],
      ),
    );
  }
}
