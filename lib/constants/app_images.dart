import 'package:flutter/material.dart';

class AppImages {
  Profile profile = Profile();
}

class Profile {
  List<AssetImage> profiles = [
    const AssetImage("assets/images/profile1.jpg"),
    const AssetImage("assets/images/profile2.jpg"),
    const AssetImage("assets/images/profile3.jpg"),
    const AssetImage("assets/images/profile4.jpg"),
    const AssetImage("assets/images/profile5.jpg"),
    const AssetImage("assets/images/profile6.jpg"),
    const AssetImage("assets/images/profile7.jpg"),
    const AssetImage("assets/images/profile8.jpg")
  ];
  AssetImage avatarPlaceHolder =
      const AssetImage("assets/images/avatar_placeholder.png");
  AssetImage profile1 = const AssetImage("assets/images/profile1.jpg");
}
