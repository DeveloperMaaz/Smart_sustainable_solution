import 'package:flutter/material.dart';

class TabBarIconButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPress;
  final IconData iconImage;

  const TabBarIconButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 64,
      child: IconButton(
        onPressed: onPress,
        icon: Icon(iconImage),
      ),
    );
  }
}
