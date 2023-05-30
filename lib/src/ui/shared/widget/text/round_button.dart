import 'package:flutter/material.dart';
import 'package:flutter_starter/src/ui/config/constants/color_constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final Color color, textColor;
  final bool isEnabled;
  final bool isSmall;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.color = ColorConstants.kPrimaryColor,
    this.textColor = Colors.white,
    this.isEnabled = true,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: isSmall ? size.width * 0.4 : size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: isEnabled ? onClick : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
