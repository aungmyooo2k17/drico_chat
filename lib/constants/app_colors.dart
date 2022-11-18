import 'package:flutter/material.dart';

class AppColors {
  _Container container = _Container();
  _Scaffold scaffold = _Scaffold();
  _Text text = _Text();
}

class _Container {
  Color background = Colors.white;
}

class _Scaffold {
  Color background = const Color(0xffF4F4F4);
}

class _Text {
  Color heading = const Color(0xff333333);
  Color subHeading = const Color(0xff333333);
  Color paragraph = const Color(0xff333333);
  Color link = Colors.blue;
  Color primaryText = const Color(0xffF86320);
  Color secondaryText = Colors.white;
}
