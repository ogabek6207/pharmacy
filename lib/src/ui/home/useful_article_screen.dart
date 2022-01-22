
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/choice_model.dart';


class UsefulArticleScreen extends StatefulWidget {
  const UsefulArticleScreen({Key? key}) : super(key: key);

  @override
  _UsefulArticleScreenState createState() => _UsefulArticleScreenState();
}

class _UsefulArticleScreenState extends State<UsefulArticleScreen> {


  @override
  initState() {
   homeBloc.getChoice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
            );
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
            children:  [
              Text(
                "Статьи",
                style: TextStyle(
                  color: const Color(0xFF1C1C1E),
                  fontSize: 17*o,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [


          StreamBuilder(
              stream: homeBloc.fetchChoice,
              builder: (
              context, AsyncSnapshot<ChoiceModel> snapshot){
            if(snapshot.hasData){
              List<ChoiceResult> choiceResult =  snapshot.data!.results;

              return  ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: choiceResult.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                      bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                    ),
                                    height: 600*h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24*o),
                                        topRight: Radius.circular(24*o),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(0)),
                                              height: 260*h,
                                              width:
                                              MediaQuery.of(context).size.width,
                                              child: ClipRRect(
                                                  borderRadius:  BorderRadius.only(
                                                      topRight: Radius.circular(24*o),
                                                      topLeft: Radius.circular(24*o)),
                                                  child: CachedNetworkImage(
                                                    imageUrl: choiceResult[index].image,
                                                    height: 260*h,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            Container(
                                              margin:  EdgeInsets.only(
                                                  top: 12*h, right: 16*w),
                                              alignment: Alignment.topRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/icons/stack.svg"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 19*h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 16*w,
                                                ),
                                                Text(
                                                  choiceResult[index].createdAt.toString(),
                                                  style:  TextStyle(
                                                    fontSize: 13*o,
                                                    color: AppTheme.grey2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16*w,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3*h,
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                Text(
                                                  choiceResult[index].title,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                    color: AppTheme.dark,
                                                    fontSize: 17*o,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16*w,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 26*h,
                                        ),
                                        Container(
                                          height: 200*h,
                                          width: MediaQuery.of(context).size.width,
                                          margin:
                                          const EdgeInsets.symmetric(horizontal: 16),
                                          child: Text(
                                            choiceResult[index].body,
                                            maxLines: 15,
                                            overflow: TextOverflow.ellipsis,
                                            style:  TextStyle(
                                              color: AppTheme.dark,
                                              fontSize: 17*o,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  height: 200*h,
                                  width: MediaQuery.of(context).size.width,
                                  margin:  EdgeInsets.only(left: 16*w, right: 16*w),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: choiceResult[index].image,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  height: 10*h,
                                ),
                                Container(
                                  margin:  EdgeInsets.symmetric(horizontal: 16*w),
                                  height: 75*h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        choiceResult[index].createdAt.toString(),
                                        style:  TextStyle(
                                          fontSize: 13*o,
                                          color: AppTheme.grey2,
                                        ),
                                      ),
                                      Text(
                                        choiceResult[index].body,
                                        style:  TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 17*o,
                                          color: AppTheme.dark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  );
            }
return const CircularProgressIndicator();
          }


          )



        ],
      ),
    );
  }


  }

