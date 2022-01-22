import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class OpenWidget extends StatefulWidget {
  const OpenWidget({Key? key}) : super(key: key);

  @override
  _OpenWidgetState createState() => _OpenWidgetState();
}

class _OpenWidgetState extends State<OpenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Column(
        children: [
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Условия хранения",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Срок годности и дата изготовления",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Фармалогическое дейсвие",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Фармакокинетика",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Показания к применению",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Приминение при береммености в п период",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Особые указания",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
           SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("С осторожностью (Меры предосторожности)",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Противопоказания",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),
SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 12,),
                const Text("Состав",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 13,
                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/down.svg"),
                const SizedBox(width: 16,),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
