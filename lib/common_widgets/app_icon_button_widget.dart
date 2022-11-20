import 'package:flutter/material.dart';

import '../constants/resources.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;
  final double? size;
  const AppIconButton(
      {Key? key,
      this.size,
      required this.onPressed,
      required this.icon,
      this.iconColor,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 36,
      height: size ?? 36,
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        fillColor: bgColor ?? Colors.transparent,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: const CircleBorder(),
        child: Icon(
          icon,
          color: iconColor ?? Resources.colors.text.heading,
          size: size ?? Resources.dimensions.icons.iconSizeMedium,
        ),
      ),
    );
  }
}
