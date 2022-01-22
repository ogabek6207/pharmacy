
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/favourite_story_bloc.dart';
import 'package:pharmacy/src/model/story_model.dart';
import '../../profile_screen.dart';

class FavouriteStoreScreen extends StatefulWidget {
  final String data;

  const FavouriteStoreScreen({Key? key, required this.data}) : super(key: key);

  @override
  _FavouriteStoreScreenState createState() => _FavouriteStoreScreenState();
}

class _FavouriteStoreScreenState extends State<FavouriteStoreScreen> {
  @override
  void initState() {
    favouritestoryBloc.getStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder(
        stream: favouritestoryBloc.fetchFavouriteStory,
        builder: (context, AsyncSnapshot<List<StoryModel>> snapshot) {
          if (snapshot.hasData) {
            List<StoryModel> storyRersult = snapshot.data!;
            return Scaffold(
              backgroundColor: AppTheme.white,
              appBar: AppBar(
                elevation: 1,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileScreen();
                    }));
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
                        widget.data,
                        style:  TextStyle(
                          color: const Color(0xFF1C1C1E),
                          fontSize: 17*o,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: ListView(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: storyRersult.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                             SizedBox(
                              height: 16*h,
                            ),
                            Container(
                              height: 130*h,
                              margin:
                                   EdgeInsets.symmetric(horizontal: 12*w),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 24*o,
                                      spreadRadius: 0,
                                      color: AppTheme.black.withOpacity(0.08)),
                                   BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 2*o,
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10*o),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   SizedBox(
                                    height: 18*h,
                                  ),
                                  Row(
                                    children: [
                                       SizedBox(
                                        width: 14.5*w,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                80*w,
                                        child: Text(
                                          storyRersult[index].address,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style:  TextStyle(
                                            color: const Color(0xFF1C1C1E),
                                            fontSize: 13*o,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            storyRersult[index].faveSelected =
                                                !storyRersult[index]
                                                    .faveSelected;
                                          });
                                        },
                                        child: storyRersult[index].faveSelected
                                            ? SvgPicture.asset(
                                                "assets/icons/like.svg",
                                                height: 24*o,
                                                width: 24*o,
                                              )
                                            : SvgPicture.asset(
                                                "assets/icons/dislike.svg",
                                                height: 24*o,
                                                width: 24*o,
                                              ),
                                      ),
                                       SizedBox(
                                        width: 16*w,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin:  EdgeInsets.only(left: 14.5*w),
                                      child: Text(storyRersult[index].name)),
                                  Container(
                                    height: 34*h,
                                    width: MediaQuery.of(context).size.width,
                                    margin:  EdgeInsets.only(top: 20*h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children:  [
                                                  SizedBox(
                                                    width: 16*w,
                                                  ),
                                                  Text(
                                                    "08:00 - 22:00",
                                                    style: TextStyle(
                                                      color: const Color(0xFF1C1C1E),
                                                      fontSize: 13*o,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                               SizedBox(
                                                height: 3*h,
                                              ),
                                              Row(
                                                children:  [
                                                  SizedBox(
                                                    width: 16*w,
                                                  ),
                                                  Text(
                                                    "Режим работы",
                                                    style: TextStyle(
                                                      color: AppTheme.grey,
                                                      fontSize: 11*o,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                   SizedBox(
                                                    width: 16*w,
                                                  ),
                                                  Text(
                                                    storyRersult[index].phone,
                                                    style:  TextStyle(
                                                      color: const Color(0xFF1C1C1E),
                                                      fontSize: 13*o,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                               SizedBox(
                                                height: 3*h,
                                              ),
                                              Row(
                                                children:  [
                                                  SizedBox(
                                                    width: 16*w,
                                                  ),
                                                  Text(
                                                    "Телефон",
                                                    style: TextStyle(
                                                      color: const Color(0xFF818C99),
                                                      fontSize: 11*o,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      })
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
