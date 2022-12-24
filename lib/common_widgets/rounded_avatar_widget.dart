import 'package:drico_chat/constants/resources.dart';
import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  final AssetImage? image;
  final bool isStory;
  final double? imageSize;
  const RoundedAvatar(
      {Key? key, this.image, required this.isStory, this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize ?? Resources.dimensions.images.imageSizeExtraLarge,
      height: imageSize ?? Resources.dimensions.images.imageSizeExtraLarge,
      decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: image ?? Resources.images.profile.avatarPlaceHolder,
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: isStory
              ? Border.all(color: Colors.blue, width: 2.0)
              : Border.all(color: Colors.transparent, width: 0.0)),
    );
  }
}
