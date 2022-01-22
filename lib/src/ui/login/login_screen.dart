import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/model/auth/login_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'accept_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Repository _repository = Repository();
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 122 * h),
            height: 72 * h,
            width: 68 * w,
            child: SvgPicture.asset("assets/icons/grandfarm1.svg"),
          ),
          SizedBox(
            height: 20 * h,
          ),
          SvgPicture.asset("assets/icons/grandfarm2.svg"),
          SizedBox(
            height: 10 * h,
          ),
          Text(
            "Аптечная сеть",
            style: TextStyle(
              fontSize: 13 * o,
              color: const Color(0xFF99A2AD),
            ),
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(

            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10 * o)),
            child: Row(
              children: [
                const Text(
                  "(+998)",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),


                      Expanded(
                        child: TextField(
                          controller: _controller,

                          maxLength: 9,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32 * w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Продолжая вы соглашаетесь с политикой обработки Персональных данных и Условиями продажи",
                  style: TextStyle(
                    color: const Color(0xFF6D7885),
                    fontSize: 11 * o,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13 * h,
          ),
          GestureDetector(
            onTap: () {
              sendData("998 " + _controller.text);
              setState(() {
                _loading = true;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 44 * h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: _loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Далее",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17 * o,
                        ),
                      ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF3F8AE0),
                borderRadius: BorderRadius.circular(10 * o),
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

  Future<void> sendData(String login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "phoneNumber",
      _controller.text,
    );
    var info = await _repository.sendLogin(login);
    setState(() {
      _loading = true;
    });
    if (info.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(info.result);
      setState(() {
        _loading = false;
      });
      if (loginModel.status == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AcceptScreen(number: login);
            },
          ),
        );
      }
    } else {
      setState(() {
        _loading = false;
      });

      ///error
    }
  }
}
