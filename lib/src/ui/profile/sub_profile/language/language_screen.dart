import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/language_model.dart';

import '../../profile_screen.dart';


class LanguageScreen extends StatefulWidget {
// ignore: prefer_typing_uninitialized_variables
final text;

const LanguageScreen({Key? key, required this.text}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Tilmodel> data = [
    Tilmodel(
      danni: "O'zbekcha",
      ism: "O'zbekcha",
      isSelected: true,
    ),
    Tilmodel(
      danni: "Ташкентская область",
      ism: "Русский",

    ),
    Tilmodel(
      danni: "Ташкентская область",
      ism: "English",

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
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context,
                MaterialPageRoute(builder: (context){return
                  const ProfileScreen();
                })
            );
          },
          child:   Icon(
            Icons.arrow_back_ios_new,
            color:  const Color(0xFF3F8AE0),
            size: 24*o,
          ),
        ),

        title: Center(
          child: SizedBox(
            height: 44*h,
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style:  TextStyle(
                        color: const Color(0xFF1C1C1E),
                        fontSize: 17*o,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text("Сохранить",
              style: TextStyle(
                color: const Color(0xFF3F8AE0),
                fontSize: 15*o,
              ),
              ),
            ],
          ),
           SizedBox(width: 16*w,),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    for(int i = 0; i< data.length; i++){
                      data[i].isSelected = false;
                    }
                    setState(() {
                      data[index].isSelected = true;
                    });
                  },
                  child:   Container(
                    color: Colors.transparent,
                    height: 48*h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                         SizedBox(
                          width: 12*w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data[index].ism,
                              style: const TextStyle(
                                color: Color(0xFF1C1C1E),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
            data[index].isSelected
                            ? SvgPicture.asset("assets/icons/done.svg")
                            : Container(),

                         SizedBox(
                            width: 14*w
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFF000000).withOpacity(0.08),
                ),
              ],
            );
          }),
    );
  }
}
