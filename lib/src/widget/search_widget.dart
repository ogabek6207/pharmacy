import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/ui/search/search_screen.dart';

class SearchWidget extends StatelessWidget {
  final double width;
  final double widthRight;

  const SearchWidget({
    Key? key,
    this.width = 12,
    this.widthRight = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: width,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return  const SearchScreen();
                    },
                  ),
                );
              },
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.greyF0,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Center(
                      child: Text(
                        "Поиск лекарств",
                        style: TextStyle(
                          color: AppTheme.grey2,
                          fontSize: 15,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return Container(
                                height: 360,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                  bottom: 42,
                                  left: 8,
                                  right: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppTheme.white,
                                  border: Border.all(
                                    color: AppTheme.black.withOpacity(0.5),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      height: 4,
                                      width: 59,
                                      decoration: BoxDecoration(
                                        color: AppTheme.grey,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      "Голосовой поиск",
                                      style: TextStyle(
                                        color: AppTheme.dark,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const SizedBox(
                                      height: 36,
                                      width: 237,
                                      child: Text(
                                        "Произнесите название препарата,действующего вещества или симптом",
                                        style: TextStyle(
                                          color: AppTheme.grey2,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Image.asset("assets/images/voice.png"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 44,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: AppTheme.blue1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Отмена",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.blue1,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              );
                            });
                      },
                      child: SvgPicture.asset("assets/icons/voice.svg"),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            "assets/icons/scan.svg",
            color: AppTheme.blue,
          ),
          SizedBox(
            width: widthRight,
          ),
        ],
      ),
    );
  }
}
