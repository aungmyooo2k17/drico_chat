import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constants/resources.dart';

class AuthInput extends StatelessWidget {
  final bool? obscureText;
  final TextInputType? type;
  final String? errorText;
  final String hintText;
  final String? Function(String?)? validator;
  final Void? Function(String?)? onSaved;
  final IconData icon;
  const AuthInput({
    Key? key,
    this.errorText,
    this.obscureText,
    this.type,
    required this.validator,
    required this.onSaved,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          size: Resources.dimensions.icons.iconSizeMediumLarge,
          icon,
          color: Colors.grey,
        ),
        SizedBox(
          width: Resources.dimensions.margins.marginMediumLarge,
        ),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: validator,
            onSaved: onSaved,
            keyboardType: type,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
                errorText: errorText,
                contentPadding: EdgeInsets.symmetric(
                    vertical: Resources.dimensions.paddings.paddingMediumLarge,
                    horizontal: Resources.dimensions.paddings.paddingSmall),
                hintText: hintText),
          ),
        ))
      ],
    );
  }
}
