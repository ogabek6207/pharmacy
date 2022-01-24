import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class AddCardScreen extends StatefulWidget {
  final String name;

  const AddCardScreen({Key? key, required this.name}) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _controllerCard = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  bool isNext = false;

  @override
  void initState() {
    _controllerCard.addListener(() {
      if (_controllerCard.text.length >= 4) {
        if (!isNext) {
          setState(() {
            isNext = true;
          });
        }
      } else {
        if (isNext) {
          setState(() {
            isNext = false;
          });
        }
      }
    });
    super.initState();
  }

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
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.blue,
            size: 24 * o,
          ),
        ),
        title: SizedBox(
          height: 44 * h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 17 * o,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    padding: EdgeInsets.symmetric(horizontal: 12 * w),
                    decoration: BoxDecoration(
                      color: AppTheme.black.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10 * o),
                    ),
                    child: TextField(
                      controller: _controllerCard,
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
                SizedBox(
                  height: 12 * h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    padding: EdgeInsets.symmetric(horizontal: 12 * w),
                    decoration: BoxDecoration(
                      color: AppTheme.black.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10 * o),
                    ),
                    child: TextField(
                      controller: _controllerCard,
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
          ),
          Container(
            height: 102 * h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppTheme.black.withOpacity(0.12),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12*h, right: 12*w, left: 12*w,),
                  height: 44 * h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:  !isNext ? AppTheme.blue : AppTheme.primary,
                    borderRadius: BorderRadius.circular(10 * o),

                  ),
                  child: Center(
                    child: Text("Добавить",

                    style: TextStyle(
                      fontSize: 17*o,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.white,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
