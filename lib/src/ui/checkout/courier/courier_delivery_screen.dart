import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class CourierDeliveryScreen extends StatefulWidget {
  const CourierDeliveryScreen({Key? key}) : super(key: key);

  @override
  _CourierDeliveryScreenState createState() => _CourierDeliveryScreenState();
}

class _CourierDeliveryScreenState extends State<CourierDeliveryScreen> {
  final TextEditingController _controller = TextEditingController();



  // @override
  // void initState() {
  //   _getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    bool k = false;
    bool c = true;
    double h = Utils.windowHeight(context);
    double w = Utils.windowHeight(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
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
        title: Column(
          children: const [
            Text(
              "Выберите аптеку",
              style: TextStyle(
                color: AppTheme.dark,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32 * h,
          ),
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
                          height: 32 * h,
                          width: MediaQuery.of(context).size.width / 2 - 25 * w,
                          margin: EdgeInsets.only(
                            top: 4 * h,
                            bottom: 4 * h,
                            left: 4 * w,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(10 * o),
                            border: Border.all(
                              color: AppTheme.black.withOpacity(0.04),
                              width: 0.5 * w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "На карте",
                              style: TextStyle(
                                color: AppTheme.blue,
                                fontSize: 13 * o,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 32 * o,
                          width: MediaQuery.of(context).size.width / 2 - 22 * w,
                          margin: EdgeInsets.only(
                            top: 4 * h,
                            bottom: 4 * h,
                            left: 4 * w,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.white1,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.black.withOpacity(0.04),
                              width: 0.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "На карте",
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
                          width: MediaQuery.of(context).size.width / 2 - 22 * w,
                          margin: EdgeInsets.only(
                            top: 4 * h,
                            bottom: 4 * h,
                            left: 4 * w,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(10 * o),
                            border: Border.all(
                              color: AppTheme.black.withOpacity(0.04),
                              width: 0.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Список",
                              style: TextStyle(
                                color: AppTheme.blue,
                                fontSize: 13 * o,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 32 * h,
                          width: MediaQuery.of(context).size.width / 2 - 22 * h,
                          margin: EdgeInsets.only(
                            top: 4 * h,
                            bottom: 4 * h,
                            right: 4 * w,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.white1,
                            borderRadius: BorderRadius.circular(10 * o),
                            border: Border.all(
                              color: AppTheme.black.withOpacity(0.04),
                              width: 0.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Список",
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
          SizedBox(
            height: 8 * h,
          ),
          Container(
            height: 36 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              horizontal: 16 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * o),
              color: AppTheme.grey,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 12 * w,
                ),
                SvgPicture.asset("assets/icons/search.svg"),
                SizedBox(
                  width: 8 * w,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Поиск",
                        hintStyle: TextStyle(
                          color: AppTheme.grey2,
                          fontSize: 15 * o,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Stack(
            children: const [
              // Expanded(
              //   child: YandexMap(
              //
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
