import 'package:flutter/material.dart';
import 'package:flutter_starter/src/extensions/contextX.dart';
import 'package:flutter_starter/src/ui/config/constants/color_constant.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: context.isDark
            ? Colors.white.withOpacity(0.2)
            : Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
