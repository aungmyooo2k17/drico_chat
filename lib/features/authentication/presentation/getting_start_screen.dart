import 'package:flutter/material.dart';
import '../../../constants/resources.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.scaffold.background,
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 36,
            height: 36,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0.0,
              fillColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              shape: const CircleBorder(),
              child: Icon(
                Icons.search,
                color: Resources.colors.text.heading,
                size: 16.0,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          SizedBox(
            width: 36,
            height: 36,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0.0,
              fillColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              shape: const CircleBorder(),
              child: Icon(
                Icons.edit,
                color: Resources.colors.text.heading,
                size: 16.0,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
        title: Text(
          "Drico Chat",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Resources.colors.scaffold.background,
      ),
      body: Container(),
    );
  }
}
