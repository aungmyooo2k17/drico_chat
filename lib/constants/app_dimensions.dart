import 'package:flutter/material.dart';

class AppDimensions {
  _FontDimens fonts = _FontDimens();
  _PaddingDimens paddings = _PaddingDimens();
  _MarginDimens margins = _MarginDimens();
  _IconDimens icons = _IconDimens();
  _ImageDimens images = _ImageDimens();
  _ContainerDimens container = _ContainerDimens();
  _ConversationItemDimens conversationItem = _ConversationItemDimens();
}

class _FontDimens {
  double ffsExtraSmall = 2.5;
  double ffsSmall = 3;
  double ffsSmallMedium = 3.2;
  double ffsSmallLarge = 3.5;
  double ffsMedium = 4;
  double ffsMediumLarge = 4.5;
  double ffsLarge = 5;
  double ffsExtraLarge = 6;

  double conversationTime = 10.0;
}

class _PaddingDimens {
  double paddingZero = 0;
  double paddingExtraSmall = 1;
  double paddingSmallTextButton = 2;
  double paddingSmall = 4;
  double paddingMedium = 8;
  double paddingMediumLarge = 16;
  double paddingLarge = 32;
  double paddingExtraExtraLarge = 48;
}

class _MarginDimens {
  double marginZero = 0;
  double marginExtraSmall = 1;
  double marginSmall = 4;
  double marginMedium = 8;
  double marginMediumLarge = 16;
  double marginLarge = 32;
  double marginExtraLarge = 40;
  double marginExtraExtraLarge = 48;
}

class _IconDimens {
  double iconSizeMedium = 16;
  double iconSizeMediumLarge = 20;
  double iconSizeLarge = 24;
  double iconSizeExtraLarge = 32;
}

class _ImageDimens {
  double imageSizeMedium = 24;
  double imageSizeMediumLarge = 32;
  double imageSizeLarge = 42;
  double imageSizeExtraLarge = 64;
}

class _ContainerDimens {
  double bottomBarHeight = 64.0;
}

class _ConversationItemDimens {
  double radius = 8.0;
}
