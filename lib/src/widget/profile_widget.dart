
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/app_theme/app_thema.dart';
import 'package:pharmacy/src/model/profilemodel.dart';


class ProfileItemWidget extends StatefulWidget {
  final ProfileModel data;

  const ProfileItemWidget({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ProfileItemWidgetState createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            widget.data.icon,
            color: AppTheme.blue,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            widget.data.text,
            style: const TextStyle(
              color: Color(0xFF1C1C1E),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            widget.data.subText,
            style: const TextStyle(
              color: Color(0xFF818C99),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SvgPicture.asset("assets/icons/arrow.svg"),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
