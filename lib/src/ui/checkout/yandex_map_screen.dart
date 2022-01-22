// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pharmacy/src/Utils/utils.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
// class YandexMapScreen extends StatefulWidget {
//   const YandexMapScreen({Key? key}) : super(key: key);
//
//   @override
//   _YandexMapScreenState createState() => _YandexMapScreenState();
// }
//
// class _YandexMapScreenState extends State<YandexMapScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     double h = Utils.windowHeight(context);
//     double w = Utils.windowWidth(context);
//     double o = (h + w) / 2;
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               const Expanded(
//                 child: YandexMap(
//
//
//                 ),
//               ),
//               Column(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     margin: EdgeInsets.only(bottom: 24*h, top: 100*h),
//                     padding: EdgeInsets.only(
//                       left: 24*w,
//                       right: 24*w,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         SvgPicture.asset(
//                           "assets/icons/add.svg",
//                         ),
//                         const Spacer(),
//                         GestureDetector(
//                           onTap: () async {
//                             if (await Permission.location.request().isGranted) {
//
//
//                             }
//                           },
//                           child: SvgPicture.asset(
//                             "assets/icons/gps.svg",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
// }
