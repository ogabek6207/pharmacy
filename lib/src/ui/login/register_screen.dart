
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/auth/login_model.dart';
import 'package:pharmacy/src/provider/app_provider.dart';
import 'package:pharmacy/src/ui/dialog/center_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screen.dart';

class RegisterScreen extends StatefulWidget {
  final String token;

  const RegisterScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool one = true, two = false;
  DateTime dateTime = DateTime.now();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();

  String birthData = "2002-10-08";

  @override

  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        title: const Text(
          "Ваши данные",
          style: TextStyle(
            color: AppTheme.dark,
          ),
        ),
      ),
      body: Column(
        children: [
           SizedBox(
            height: 24*h,
          ),
          Container(

            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Expanded(

              child: TextField(
                controller: _controllerName,
                decoration:  const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Имя*",
                ),
              ),
            ),
          ),
           SizedBox(
            height: 12*h,
          ),
          Container(
            height: 52*h,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.symmetric(horizontal: 16*w),
            margin:  EdgeInsets.symmetric(horizontal: 16*w),
            decoration: BoxDecoration(
              color: AppTheme.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10*o),
            ),
            child: TextField(
              controller: _controllerSurName,
              decoration:  const InputDecoration(
                border: InputBorder.none,
                labelText: "Фамилия",
              ),
            ),
          ),
           SizedBox(
            height: 12*h,
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
                currentTime: DateTime.now(),
              );
            },
            child: Container(
              height: 52,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.black.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    birthData,
                    style:  TextStyle(
                      color: AppTheme.dark,
                      fontSize: 15*o,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
           SizedBox(
            height: 12*h,
          ),
          SizedBox(
            height: 44*h,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      one = true;
                    });
                  },
                  child: Row(
                    children: [
                       SizedBox(
                        width: 16*w,
                      ),
                      one
                          ? SvgPicture.asset("assets/icons/radio.svg")
                          : SvgPicture.asset("assets/icons/radio1.svg"),
                       SizedBox(
                        width: 16*w,
                      ),
                       Text(
                        "Мужчина",
                        style: TextStyle(
                          color: const Color(0xFF1C1C1E),
                          fontSize: 15*o,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      one = false;
                    });
                  },
                  child: Row(
                    children: [
                       SizedBox(
                        width: 16*w,
                      ),
                      one
                          ? SvgPicture.asset("assets/icons/radio1.svg")
                          : SvgPicture.asset("assets/icons/radio.svg"),
                      const SizedBox(
                        width: 16,
                      ),
                       Text(
                        "Женщина",
                        style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 15*o,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              String gender = one ? "man" : "woman";
              _registerData(
                _controllerName.text,
                _controllerSurName.text,
                gender,
                birthData,
              );
            },
            child: Container(
              height: 44*h,
              width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.symmetric(
                horizontal: 12*w,
              ),
              decoration: BoxDecoration(
                color: AppTheme.blue,
                borderRadius: BorderRadius.circular(10*o),
              ),
              child:  Center(
                child: Text(
                  "Сохранить",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 17*o,
                  ),
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

  Future<void>_registerData(
    String firstName,
    String lastName,
    String gender,
    String birthData,
  ) async {
    var response = await AppProvider().registerData(
      firstName,
      lastName,
      gender,
      birthData,
      widget.token,
    );

    if (response.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(response.result);
      if (loginModel.status == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", widget.token);
        prefs.setString("firstName", firstName);
        prefs.setString("lastName", lastName);
        prefs.setString("gender", gender);
        prefs.setString("birthData", birthData);

        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ),
        );
      } else {
        CenterDialog.showErrorDialog(context, loginModel.msg);
      }
    } else {
      CenterDialog.showErrorDialog(
        context,
        response.result,
      );
    }
  }

  String format(int n) {
    if (n < 10) {
      return "0" + n.toString();
    } else {
      return n.toString();
    }
  }
}
