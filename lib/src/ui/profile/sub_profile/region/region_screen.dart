import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/region_bloc.dart';
import 'package:pharmacy/src/model/region_model1.dart';

class RegionScreen extends StatefulWidget {
  final String text;

  const RegionScreen({Key? key, required this.text}) : super(key: key);

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {


  @override
  void initState() {
    regionBloc.getRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:  Icon(
            Icons.arrow_back_ios_new,
            color: const Color(0xFF3F8AE0),
            size: 24*o,
          ),
        ),
        title: SizedBox(
          height: 44*h,
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
        children: [
          Container(
            height: 36*h,
            width: MediaQuery.of(context).size.width,
            margin:
                 EdgeInsets.only(left: 13*w, right: 13*w, top: 8*h, bottom: 8*h),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEDF0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                 SizedBox(
                  width: 16*w,
                ),
                SvgPicture.asset("assets/icons/search.svg"),
                 SizedBox(
                  width: 16*w,
                ),
                 Text(
                  "Поиск",
                  style: TextStyle(
                    color: const Color(0xFF818C99),
                    fontSize: 15*o,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: regionBloc.fetchRegion,
              builder: (context, AsyncSnapshot<List<RegionModel>> snapshot) {
                if (snapshot.hasData) {
                  List<RegionModel> regionRersult = snapshot.data!;

                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: regionRersult.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                regionBloc.updateRegion(regionRersult, index);
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 61*h,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                     SizedBox(
                                      width: 13*w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          regionRersult[index].name,
                                          style:  TextStyle(
                                            color: const Color(0xFF1C1C1E),
                                            fontSize: 15*o,
                                          ),
                                        ),
                                         SizedBox(
                                          height: 2*h,
                                        ),
                                        Text(
                                          regionRersult[index].name,
                                          style:  TextStyle(
                                            color: const Color(0xFF818C99),
                                            fontSize: 13*o,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    regionRersult[index].isSelected
                                        ? SvgPicture.asset(
                                            "assets/icons/loc.svg",
                                            color: AppTheme.blue,
                                          )
                                        : Container(),
                                     SizedBox(
                                      width: 15*w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 1*h,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xFF000000).withOpacity(0.08),
                            ),
                          ],
                        );
                      });
                }

                return const CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
