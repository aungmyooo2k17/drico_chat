import 'package:flutter/material.dart';

class AppColors {
  _Container container = _Container();
  _Scaffold scaffold = _Scaffold();
  _Text text = _Text();
  _Button button = _Button();
}

class _Button {
  Color white = Colors.white;
  Color grey = Colors.grey;
}

class _Container {
  Color background = Colors.white;
  Color textFormField = const Color(0xffF6F6F6);
  Color bgConversationItem = Colors.blue;
}

class _Scaffold {
  Color background = const Color(0xffF4F4F4);
}

class _Text {
  Color white = Colors.white;
  Color heading = const Color(0xff333333);
  Color subHeading = const Color(0xff333333);
  Color paragraph = const Color(0xff333333);
  Color link = Colors.blue;
  Color primaryText = const Color(0xffF86320);
  Color secondaryText = Colors.white;
}
