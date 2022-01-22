import 'package:flutter/cupertino.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/card_model.dart';

class CardWidget extends StatefulWidget {
  final CardModel data;
 const CardWidget({Key? key, required this.data}) : super(key: key);





  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
children: [
  Text(widget.data.text,
  style: const TextStyle(
    color: AppTheme.grey2,
    fontSize: 13,
  ),),
  const Spacer(),
  Text(widget.data.price,
    style: const TextStyle(
      color: AppTheme.grey2,
      fontSize: 13,
    ),
  ),
  const SizedBox(width: 16,),
],
      ),
    );
  }
}