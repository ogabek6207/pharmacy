
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/model/profilemodel.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/favourite_store/favourite_store_screen.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/history/history_order_screen.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/language/language_screen.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/my_info/my_info_screen.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/payment/payment_card_screen.dart';
import 'package:pharmacy/src/ui/profile/sub_profile/region/region_screen.dart';
import 'package:pharmacy/src/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            "assets/images/profile_logo.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const MyInfoScreen(
                    lastName: '',
                    gender: '',
                    birthData: '',
                    firstName: '',
                  );
                }),
              );
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    height: 60 * h,
                    width: MediaQuery.of(context).size.width - 50 * w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 9 * h,
                        ),
                        Text(
                          "Abdijabborov Og'abek",
                          style: TextStyle(
                            fontSize: 17 * o,
                            color: const Color(0xFF1C1C1E),
                          ),
                        ),
                        SizedBox(
                          height: 2 * h,
                        ),
                        Text(
                          "Мои данные",
                          style: TextStyle(
                            fontSize: 13 * o,
                            color: const Color(0xFF818C99),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/icons/arrow.svg"),
                  SizedBox(
                    width: 16 * w,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/gift.svg",
                subText: '',
                text: 'Бонусная карта',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RegionScreen(
                    text: "Город",
                  );
                }),
              );
            },
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/loc.svg",
                subText: 'Tashkent',
                text: 'Город',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const FavouriteStoreScreen(data: "Любимые аптеки");
                }),
              );
            },
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/plus2.svg",
                subText: '',
                text: 'Любимые аптеки',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const PaymentCardScreen(
                    text: "Платежные карты",
                  );
                }),
              );
            },
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/cart.svg",
                subText: '',
                text: 'Платежные карты',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HistoryOrderScreen(
                  text: "История заказов",
                );
              }));
            },
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/market.svg",
                subText: '',
                text: 'История заказов',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LanguageScreen(
                  text: "Язык",
                );
              }));
            },
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/globe.svg",
                subText: '',
                text: 'Язык',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ProfileItemWidget(
              data: ProfileModel(
                icon: "assets/icons/error.svg",
                subText: '',
                text: 'О приложении',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
