import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

import '../../profile_screen.dart';
import 'add_card.dart';


class PaymentCardScreen extends StatefulWidget {
 // ignore: prefer_typing_uninitialized_variables
 final text;

 const PaymentCardScreen({Key? key, required this.text}) : super(key: key);

  @override
  _PaymentCardScreenState createState() => _PaymentCardScreenState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('text', text));
    properties.add(DiagnosticsProperty('text', text));
    properties.add(DiagnosticsProperty('text', text));
    properties.add(DiagnosticsProperty('text', text));
  }
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
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
          onTap: (){
            Navigator.pop(context,
                MaterialPageRoute(builder: (context){return
                  const ProfileScreen();
                })
            );
          },
          child:   Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.blue,
            size: 24*o,
          ),
        ),

        title: SizedBox(
          height: 44*o,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style:  TextStyle(
                  color: AppTheme.dark,
                  fontSize: 17*o,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
           SizedBox(height: 164*h,),
          Center(child: Image.asset("assets/images/karta.png")),
           SizedBox(height: 24*h,),
           Text("Вы еще не добавили карту",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 20*o,
          ),
          ),
           SizedBox(height: 4*h,),
           Text("Добавьте карту для оплаты ваших заказов",
            style: TextStyle(
              color: AppTheme.dark,
              fontSize: 15*o,
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const AddCardScreen(name: "Добавить карту",);
              }),);
            },
            child:  Container(height: 36*h,
            width: 148*w,
            margin:  EdgeInsets.only(top: 24*h,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:  const Color(0xFF3F8AE0),)
            ),
            child:  Center(
              child: Text("Добавить карту",
                style: TextStyle(
                  color: const Color(0xFF3F8AE0),
                  fontSize: 15*o,
                ),
              ),
            ),
          ),),

        ],
      ),
    );
  }
}
