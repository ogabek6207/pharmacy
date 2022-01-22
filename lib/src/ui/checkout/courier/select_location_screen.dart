import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

import '../by_courier_screen.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  _SelectLocationScreenState createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 24 * o,
            color: AppTheme.blue,
          ),
        ),
        title: Text(
          "Выбрать местоположение",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17 * o,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 224,
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ByCourierScreen();
                }),
              );
            },
            child: Container(
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 12 * w),
              decoration: BoxDecoration(
                color: AppTheme.blue,
                borderRadius: BorderRadius.circular(10 * o),
              ),
              child: Center(
                child: Text(
                  "Подтвердить адрес",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 17 * o,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
