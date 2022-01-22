// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/model/my_info_model.dart';

import '../../profile_screen.dart';

class HistoryOrderScreen extends StatefulWidget {

  final text;

  const HistoryOrderScreen({Key? key, required this.text}) : super(key: key);

  @override
  _HistoryOrderScreenState createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  List<MyInfoModel> data = [
    MyInfoModel(
      danni: "2 июня",
      ism: "№00029323",
      arrow: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return const ProfileScreen();
            }));
          },
          child:  Icon(
            Icons.arrow_back_ios_new,
            color: const Color(0xFF3F8AE0),
            size: 24*o,
          ),
        ),
        title: SizedBox(
          height: 44*h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "История заказов",
                style: TextStyle(
                  color: const Color(0xFF1C1C1E),
                  fontSize: 17*o,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF000000).withOpacity(0.08),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                     SizedBox(
                      height: 16*h,
                    ),
                    Container(
                      height: 262*h,
                      margin:  EdgeInsets.symmetric(horizontal: 12*w),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10*o),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(
                            height: 16*h,
                          ),
                          Row(
                            children: [
                               SizedBox(
                                width: 16*w,
                              ),
                              Text(
                                data[index].ism,
                                style:  TextStyle(
                                  color: const Color(0xFF1C1C1E),
                                  fontSize: 17*o,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(data[index].arrow),
                               SizedBox(
                                width: 16*w,
                              ),
                            ],
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 14.5*w,
                              top: 4*h,
                            ),
                            child: Text(
                              data[index].danni,
                              style: const TextStyle(
                                color: Color(0xFF818C99),
                              ),
                            ),
                          ),
                           SizedBox(
                            height: 17*h,
                          ),
                          Container(
                            height: 0.5*h,
                            width: MediaQuery.of(context).size.width,
                            margin:  EdgeInsets.symmetric(horizontal: 16*w),
                            color: const Color(0xFF000000).withOpacity(0.08),
                          ),
                          Container(
                            margin:  EdgeInsets.only(top: 16*h),
                            height: 24*h,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                 SizedBox(
                                  height: 24*h,
                                  width: 160*w,
                                  child: Text(
                                    "Доставка курьером",
                                    style: TextStyle(
                                      fontSize: 17*o,
                                      color: const Color(0xFF1C1C1E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 22*h,
                                  width: 82*w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF792EC0),
                                    borderRadius: BorderRadius.circular(4*o),
                                  ),
                                  child:  Center(
                                    child: Text(
                                      "Доставлен",
                                      style: TextStyle(
                                        fontSize: 11*o,
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                            height: 16*h,
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 16*w,
                            ),
                            child:  Text(
                              "Дата доставки: 2 инюя 12:04",
                              style: TextStyle(
                                fontSize: 13*o,
                                color: const Color(0xFF1C1C1E),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 16*w,
                              top: 4*h,
                            ),
                            child: const Text(
                              "К оплате 62 000 сум",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF818C99),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            height: 56*h,
                            width: MediaQuery.of(context).size.width,
                            margin:  EdgeInsets.only(
                              top: 16*h,
                            ),
                            child: Row(
                              children: [
                                 SizedBox(
                                  width: 16*w,
                                ),
                                SizedBox(
                                  height: 56*o,
                                  width: 56*o,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/rasm7.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  width: 16*w,
                                ),
                                SizedBox(
                                  height: 56*o,
                                  width: 56*o,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/dori15.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 16*h,
                    ),
                    Container(
                      height: 262*h,
                      margin:  EdgeInsets.symmetric(horizontal: 12*w),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10*o),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(
                            height: 16*h,
                          ),
                          Row(
                            children: [
                               SizedBox(
                                width: 16*w,
                              ),
                              Text(
                                data[index].ism,
                                style:  TextStyle(
                                  color: const Color(0xFF1C1C1E),
                                  fontSize: 17*o,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(data[index].arrow),
                               SizedBox(
                                width: 16*w,
                              ),
                            ],
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 14.5*w,
                              top: 4*h,
                            ),
                            child: Text(
                              data[index].danni,
                              style: const TextStyle(
                                color: Color(0xFF818C99),
                              ),
                            ),
                          ),
                           SizedBox(
                            height: 17*h,
                          ),
                          Container(
                            height: 0.5*h,
                            width: MediaQuery.of(context).size.width,
                            margin:  EdgeInsets.symmetric(horizontal: 16*w),
                            color: const Color(0xFF000000).withOpacity(0.08),
                          ),
                          Container(
                            margin:  EdgeInsets.only(top: 16*h),
                            height: 24*w,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                 SizedBox(
                                  height: 24*h,
                                  width: 160*w,
                                  child: Text(
                                    "Доставка курьером",
                                    style: TextStyle(
                                      fontSize: 17*o,
                                      color: const Color(0xFF1C1C1E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 22*h,
                                  width: 70*w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA3ADB8),
                                    borderRadius: BorderRadius.circular(4*o),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Отменен",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                            height: 16*h,
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 16*w,
                            ),
                            child:  Text(
                              "Дата доставки: 2 инюя 12:04",
                              style: TextStyle(
                                fontSize: 13*o,
                                color: const Color(0xFF1C1C1E),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(
                              left: 16*w,
                              top: 4*h,
                            ),
                            child:  Text(
                              "К оплате 62 000 сум",
                              style: TextStyle(
                                fontSize: 13*o,
                                color: const Color(0xFF818C99),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            height: 56*h,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                              top: 16,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  height: 56*o,
                                  width: 56*o,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/rasm7.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  width: 16*w,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
