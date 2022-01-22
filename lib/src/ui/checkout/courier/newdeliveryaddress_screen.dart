import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/ui/checkout/courier/select_location_screen.dart';

class NewDeliveryAddressScreen extends StatefulWidget {
  const NewDeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _NewDeliveryAddressScreenState createState() => _NewDeliveryAddressScreenState();
}

class _NewDeliveryAddressScreenState extends State<NewDeliveryAddressScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
    appBar:  AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        leading:  Icon(
          Icons.arrow_back_ios,
          size: 24*o,
          color: AppTheme.blue,
        ),
        title:  Text(
          "Курьеркая доставка",
          style: TextStyle(
            color: AppTheme.dark,
            fontSize: 17*o,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24*h,),


          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SelectLocationScreen();

              }),);
            },
            child:
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16*w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10*o),
                border: Border.all(color: AppTheme.blue,width: 1),

                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/loc.svg",
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 8*w,),
                  SizedBox(
                    child: Center(
                      child: Text("Отрправить локацию",
                        style: TextStyle(
                          color: AppTheme.blue,
                          fontSize: 17*o,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),


SizedBox(height: 16*h,),
          Container(height: 52*h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16*w),
            decoration: BoxDecoration(
              color: AppTheme.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10*w),

            ),
            child: Row(
              children: [

                SizedBox(width: 12*w,),
Text("Квартира/офис",
style: TextStyle(
  color: AppTheme.grey1,
  fontWeight: FontWeight.normal,
  fontSize: 16*o,
),
),

              ],
            ),
          ),
          SizedBox(height: 12*h,),
          Container(
            height: 52*h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16*w),
            child: Row(
              children: [
                Container(

                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width/2-24*w,

                  decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10*o),
                  ),
                  child: const Center(
                    child: Text("Подъзд",
                    style: TextStyle(
                      color: AppTheme.grey1
                    ),
                    ),

                  ),
                ),
                 const Spacer(),
                 Container(

                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width/2-24,

                  decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Этаж",
                    style: TextStyle(
                      color: AppTheme.grey1
                    ),
                    ),

                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 12*h,),
          Container(height: 52*h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16*w),
            decoration: BoxDecoration(
              color: AppTheme.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10*o),

            ),
            child: Row(
              children: [

                SizedBox(width: 12*w,),
                Text("Комментарий",
                  style: TextStyle(
                    color: AppTheme.grey1,
                    fontWeight: FontWeight.normal,
                    fontSize: 16*o,
                  ),
                ),

              ],
            ),
          ),
          const Spacer(),
          Container(height: 1*h,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),

          ),
          SizedBox(height: 12*h,),
          Container(height: 44*h,
          width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12*w),
            decoration: BoxDecoration(
              color: AppTheme.blue,
              borderRadius: BorderRadius.circular(10*o),

            ),
            child: Center(
              child: Text("Привезти сюда",
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 17*o,
                fontWeight: FontWeight.w500,

              ),
              ),
            ),
          ),
          SizedBox(height: 44*h,),
        ],
      ),
    );
  }
}
