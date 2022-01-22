import 'package:flutter/cupertino.dart';
import 'package:pharmacy/src/model/auth/http_result.dart';

class Utils {
  static double windowHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height / 812;
  }

  static double windowWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width / 375;
  }

  static String errorMessage(HttpResult info) {
    String error = "";
    if (info.statusCode != -1 && info.statusCode < 500) {
      error = info.result["detail"] ??
          info.result["message"]
    ?? info.result["msg"] ??
    info.statusCode.toString();
  }
    else{
      error = info.result;
    }
    return error;
  }
}
