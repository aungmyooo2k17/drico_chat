import 'package:flutter/material.dart';

import '../constants/resources.dart';

class AuthInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const AuthInput({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
            size: Resources.dimensions.icons.iconSizeMediumLarge,
            Icons.alternate_email),
        SizedBox(
          width: Resources.dimensions.margins.marginMediumLarge,
        ),
        Flexible(
            child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: Resources.dimensions.paddings.paddingMediumLarge,
                  horizontal: Resources.dimensions.paddings.paddingSmall),
              hintText: widget.hintText),
        ))
      ],
    );
  }
}
