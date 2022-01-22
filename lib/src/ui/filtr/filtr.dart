
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';

class FiltrScreen extends StatefulWidget {
  const FiltrScreen({Key? key}) : super(key: key);

  @override
  _FiltrScreenState createState() => _FiltrScreenState();
}

class _FiltrScreenState extends State<FiltrScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        leading: GestureDetector(
child: const Icon(Icons.arrow_back_ios,
color: AppTheme.blue,
  size: 24,
),

        ),
        title: const Text("Фильтр",
        style: TextStyle(
          color: AppTheme.dark,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 14,),
          Row(
            children: const [
              SizedBox(width: 12,),
              Text("Цена",
              style: TextStyle(
                color: AppTheme.grey1,
              ),
              ),
            ],
          ),


          Row(
            children: [
              Container(height: 2,
              width: MediaQuery.of(context).size.width/3-30,

                color: const Color(0xFFE1E3E6
                ),
              ),
              Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: AppTheme.black.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    )]
                  ),


                  child: SvgPicture.asset("assets/icons/know.svg")),
              Container(height: 2,
                width: MediaQuery.of(context).size.width/3-30,

                color: AppTheme.blue,

              ),
              Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(

                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                        color: AppTheme.black.withOpacity(0.15),
                      ),]
                  ),


                  child: SvgPicture.asset("assets/icons/know.svg")),
              Container(height: 2,
                width: MediaQuery.of(context).size.width/3-30,

                color: const Color(0xFFE1E3E6
                ),
              ),
            ],
          ),
const SizedBox(height: 36,),
Row(
  children: [
    const Spacer(),
        Container(height: 52,

    width: MediaQuery.of(context).size.width/2-16,

      decoration: BoxDecoration(

        color: const Color(0xFFF2F3F5),

        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppTheme.black.withOpacity(0.12),width: 0.5),



      ),

    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(

        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "От",

        ),

      ),
    ),

    ),
const Spacer(),


    Container(height: 52,
      width: MediaQuery.of(context).size.width/2-16,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.black.withOpacity(0.12),width: 0.5),

      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "До",

          ),
        ),
      ),
    ),

    const Spacer(),


  ],
),

const SizedBox(height: 24,),
          Container(height: 48,
          width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 12),

            child: Row(
              children: [
                const Text("Форма выпуска",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 15,

                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow2.svg"),

              ],
            ),
          ),
          Container(height: 0.5,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.08),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
           Container(height: 48,
          width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 12),

            child: Row(
              children: [
                const Text("Производители",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 15,

                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow2.svg"),

              ],
            ),
          ),
          Container(height: 0.5,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.08),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
           Container(height: 48,
          width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 12),

            child: Row(
              children: [
                const Text("Страна",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 15,

                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow2.svg"),

              ],
            ),
          ),
          Container(height: 0.5,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.08),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
           Container(height: 48,
          width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 12),

            child: Row(
              children: [
                const Text("Действующее вещество",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontSize: 15,

                ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow2.svg"),

              ],
            ),
          ),
          Container(height: 0.5,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.08),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
const SizedBox(height: 200,),
          Container(height: 1,
          width: MediaQuery.of(context).size.width,
            color: AppTheme.black.withOpacity(0.12),

          ),
const SizedBox(height: 12,),
Container(height: 44,
width: MediaQuery.of(context).size.width,
  margin: const EdgeInsets.symmetric(horizontal: 12),
  decoration: BoxDecoration(
    color: AppTheme.blue,
borderRadius: BorderRadius.circular(10),
  ),
  child: const Center(
    child: Text("Применить",
    style: TextStyle(
      color: AppTheme.white,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    ),
  ),
),
        ],
      ),
    );
  }
}
