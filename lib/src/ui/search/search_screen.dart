
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/search_bloc.dart';
import 'package:pharmacy/src/model/drugs_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool empty = true;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        searchBloc.getSearch(_controller.text);
        if (empty) {
          setState(() {
            empty = false;
          });
        }
      } else {
        setState(() {
          empty = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          SizedBox(
            height: 52 * h,
          ),
          Row(
            children: [
              Container(
                height: 36,
                width: 250 * w,
                margin: EdgeInsets.only(
                  left: 12 * w,
                  right: 16 * w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEDF0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12 * w,
                    ),
                    SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: 16 * o,
                      width: 16 * o,
                    ),
                    SizedBox(
                      width: 8 * w,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Поиск",
                          hintStyle: TextStyle(
                            color: AppTheme.grey1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.text = "";
                  });
                },
                child: const Text(
                  "Отменить",
                  style: TextStyle(
                    color: AppTheme.blue,
                    fontSize: 17,
                  ),
                ),
              ),
               SizedBox(
                width: 12*w,
              ),
            ],
          ),
          Expanded(
            child: empty
                ? Column(
                    children: [
                      const Spacer(),
                      Image.asset(
                        "assets/images/search.png",
                      ),
                      const Spacer(),
                    ],
                  )
                : StreamBuilder(
                  stream: searchBloc.getSearchInfo,
                  builder: (context, AsyncSnapshot<DrugsModel> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(24*o),
                              child:
                                  Text(snapshot.data!.results[index].name),
                            );
                          });
                    }
                    return Container();
                  },
                ),
          ),
        ],
      ),
    );
  }
}
