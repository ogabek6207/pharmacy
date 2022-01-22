import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/model/auth/accept_model.dart';
import 'package:pharmacy/src/provider/app_provider.dart';
import 'package:pharmacy/src/ui/dialog/center_dialog.dart';
import 'package:pharmacy/src/ui/login/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screen.dart';

class AcceptScreen extends StatefulWidget {
  final String number;

  const AcceptScreen({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  _PostRequestScreenState createState() => _PostRequestScreenState();
}

class _PostRequestScreenState extends State<AcceptScreen> {
  final TextEditingController _controller = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 138 * h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text(
                  "Проверочный код отправлен на номер",
                  style: TextStyle(
                    fontSize: 13 * o,
                    color: const Color(0xFF99A2AD),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16 * w),
            child: Text(
              "+" + _numberFormat(widget.number),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 4,
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: "Код подтверждения",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 13 * h,
          ),
          GestureDetector(
            onTap: () {
              _senData(
                widget.number,
                _controller.text,
              );
              setState(() {
                loading = true;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12 * w),
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Подтвердить номер",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17 * o,
                        ),
                      ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF3F8AE0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 24 * h,
          ),
        ],
      ),
    );
  }

  String _numberFormat(String number) {
    String s = "";
    for (int i = 0; i < number.length; i++) {
      if (i > 5 && i < 11) {
        if (i == 6 || i == 9 || i == 11) s += " ";
        s += "*";
      } else {
        s += number[i];
      }
    }
    return s;
  }

  Future<void> _senData(String number, String code) async {
    if (code.length == 4) {
      var response = await AppProvider().getAccept(number, code);
      if (response.isSucces) {
        var result = AcceptModel.fromJson(response.result);
        if (result.status == 1) {
          if (result.user.complete == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegisterScreen(
                    token: result.token,
                  );
                },
              ),
            );
          } else {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString(
              "firstName",
              result.user.firstName,
            );
            print(result);
            pref.setString(
              "lastName",
              result.user.lastName,
            );
            pref.setString(
              "gender",
              result.user.gender,
            );
            pref.setString(
              "birthData",
              result.user.birthDate,
            );
            pref.setString("token", result.token);

            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainScreen();
                },
              ),
            );
          }
        } else {
          CenterDialog.showErrorDialog(
            context,
            result.msg,
          );
        }
      } else {
        CenterDialog.showErrorDialog(
          context,
          response.result,
        );
      }
    } else {
      CenterDialog.showErrorDialog(
        context,
        "sms code yetarli emas",
      );
    }
  }
}
