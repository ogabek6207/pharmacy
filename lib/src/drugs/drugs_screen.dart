

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/Utils/utils.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/bloc/drugs_bloc.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
class DrugsScreen extends StatefulWidget {
  const DrugsScreen({Key? key}) : super(key: key);

  @override
  _DrugsScreenState createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {


  @override
  initState() {
drugsBloc.fetchDrugs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
      ),
      body:


      StreamBuilder(


          stream: drugsBloc.fetchDrugs,
          builder: (context, AsyncSnapshot<DrugsModel> snapshot){
        if (snapshot.hasData){
          List<DrugsResult> drugsRersult = snapshot.data!.results;
          return Center(
            child: drugsRersult.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
              itemCount: drugsRersult.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(color: AppTheme.white),
                  margin:  EdgeInsets.only(
                    right: 12*w,
                  ),
                  width: 140*w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: drugsRersult[index].image,
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        height: 42*o,
                        width: 42*o,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        drugsRersult[index].name,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "awalar",
                        style: TextStyle(
                          color: AppTheme.grey2,
                          fontSize: 12*o,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 12*h,
                      ),
                      drugsRersult[index].price == 0
                          ? GestureDetector(
                        onTap: () {
                          setState(() {
                            drugsRersult[index].price = 1;
                          });
                        },
                        child: Container(
                          height: 30*o,
                          width: 120*o,
                          margin:  EdgeInsets.only(left: 5*w),
                          decoration: BoxDecoration(
                            color: AppTheme.blue,
                            borderRadius: BorderRadius.circular(10*o),
                          ),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                drugsRersult[index].basePrice.toString(),
                                style: const TextStyle(
                                  color: AppTheme.white,
                                ),
                              ),
                              SizedBox(
                                width: 8*w,
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                        height: 30*h,
                        width: 120*w,
                        decoration: BoxDecoration(
                          color: AppTheme.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10*o),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  drugsRersult[index].price--;
                                });
                              },
                              child: Container(
                                height: 26*o,
                                width: 26*o,
                                decoration: BoxDecoration(
                                  color: AppTheme.blue,
                                  borderRadius:
                                  BorderRadius.circular(10*o),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: Text(
                                drugsRersult[index].price.toString() + " шт.",
                                style:  TextStyle(
                                  color: AppTheme.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15*o,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  drugsRersult[index].price++;
                                });
                              },
                              child: Container(
                                height: 26*o,
                                width: 26*o,
                                decoration: BoxDecoration(
                                  color: AppTheme.blue,
                                  borderRadius:
                                  BorderRadius.circular(10*o),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      }),






    );
  }

}
