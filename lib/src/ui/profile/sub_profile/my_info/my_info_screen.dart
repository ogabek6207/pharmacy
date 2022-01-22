import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/my_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../profile_screen.dart';

class MyInfoScreen extends StatefulWidget {
  final String firstName, lastName, gender, birthData;

  const MyInfoScreen(
      {Key? key,
      required this.birthData,
      required this.firstName,
      required this.lastName,
      required this.gender})
      : super(key: key);

  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  bool one = false;
  List<MyInfoModel> data7 = [
    MyInfoModel(danni: "Имя*", ism: "Og'abek", arrow: ""),
  ];

  String lastName = "";
  String gender = "";
  String birthData = "";
  String phoneNumber = "";
  DateTime dateTime = DateTime.now();
  final TextEditingController _controllerfirstName = TextEditingController();
  final TextEditingController _controllerlastName = TextEditingController();
  final TextEditingController _controllerphoneNumber = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }));
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: const Color(0xFF3F8AE0),
                size: 24 * o,
              ),
            ),
          ],
        ),
        title: SizedBox(
          height: 44 * h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Мои данные",
                style: TextStyle(
                  color: Color(0xFF1C1C1E),
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data7.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 1 * h,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF000000).withOpacity(0.08),
              ),
              Container(
                height: 52 * h,
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(top: 12 * h, right: 16 * w, left: 16 * w),
                padding: EdgeInsets.symmetric(horizontal: 16 * w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F5),
                  border: Border.all(
                      color: const Color(0xFF000000).withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(10 * o),
                ),
                child: TextField(
                  controller: _controllerfirstName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Имя*",
                    labelStyle: TextStyle(

                      fontSize: 11,
                    ),
                  ),
                ),
              ),
              Container(
                height: 52 * h,
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(top: 12 * h, right: 16 * w, left: 16 * w),
                padding: EdgeInsets.symmetric(horizontal: 16 * w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F5),
                  border: Border.all(
                      color: const Color(0xFF000000).withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(10 * w),
                ),
                child: TextField(
                  controller: _controllerlastName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Фамилия*",
                    labelStyle: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
              Container(
                height: 52,
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(top: 12 * h, right: 16 * w, left: 16 * w),
                padding: EdgeInsets.symmetric(horizontal: 16 * w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F5),
                  border: Border.all(
                      color: const Color(0xFF000000).withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(10 * o),
                ),
                child: TextField(
                  controller: _controllerphoneNumber,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Телефон",
                      labelStyle: TextStyle()),
                ),
              ),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 10, 8),
                    maxTime: DateTime.now(),
                    onConfirm: (date) {
                      dateTime = date;
                      setState(() {
                        birthData = date.toString().split(" ")[0];
                      });
                    },
                    currentTime: dateTime,
                  );
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 12 * h, right: 16 * w, left: 16 * w),
                  padding: EdgeInsets.symmetric(horizontal: 16 * w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3F5),
                    border: Border.all(
                        color: const Color(0xFF000000).withOpacity(0.12)),
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const Text("Дата рождение"),
                      Text(
                        birthData,
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15 * o,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28 * h,
              ),
              SizedBox(
                height: 44 * h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            one = false;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            Container(
                              child: one
                                  ? SvgPicture.asset("assets/icons/radio1.svg")
                                  : SvgPicture.asset("assets/icons/radio.svg"),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            Text(
                              "Мужчина",
                              style: TextStyle(
                                color: const Color(0xFF1C1C1E),
                                fontSize: 15 * o,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            one = true;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            Container(
                              child: one
                                  ? SvgPicture.asset("assets/icons/radio.svg")
                                  : SvgPicture.asset("assets/icons/radio1.svg"),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            const Text(
                              "Женщина",
                              style: TextStyle(
                                color: Color(0xFF1C1C1E),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(
      () {
        _controllerfirstName.text = pref.getString("firstName") ?? "";
        _controllerlastName.text = pref.getString("lastName") ?? "";
        birthData = pref.getString("birthData") ?? "";
        gender = pref.getString("gender") ?? "";
        _controllerphoneNumber.text = pref.getString("phoneNumber") ?? "";
        if (gender == "man") {
          one = false;
        } else {
          one = true;
        }
        _controllerphoneNumber.text = pref.getString("phoneNumber") ?? "";
      },
    );
  }
}
