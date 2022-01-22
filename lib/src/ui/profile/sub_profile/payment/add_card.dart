
import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

  class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

    @override
    _AddCardScreenState createState() => _AddCardScreenState();
  }

  class _AddCardScreenState extends State<AddCardScreen> {
    final TextEditingController _controller = TextEditingController();

    @override
    Widget build(BuildContext context) {
      double h = Utils.windowHeight(context);
      double w = Utils.windowWidth(context);
      double o = (h + w) / 2;
      return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child:  Icon(
              Icons.arrow_back_ios_new,
              color: AppTheme.blue,
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
                  "ebughijfasmkjbhy",
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 17*o,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 52*h,
                width: MediaQuery.of(context).size.width,
                margin:  EdgeInsets.symmetric(horizontal: 16*w),
                padding:  EdgeInsets.symmetric(horizontal: 12*w),
                decoration: BoxDecoration(
                  color: AppTheme.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10*o),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "Номер карты",
                    labelStyle: TextStyle(
                      color: AppTheme.grey1,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12*h,),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 52*h,
                width: MediaQuery.of(context).size.width,
                margin:  EdgeInsets.symmetric(horizontal: 16*w),
                padding:  EdgeInsets.symmetric(horizontal: 12*w),
                decoration: BoxDecoration(
                  color: AppTheme.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10*o),
                ),
                child: TextField(
                  controller: _controller,
                decoration: const InputDecoration(
                  labelText: "Срок действия",
                  labelStyle: TextStyle(
                    color: AppTheme.grey1,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
