import 'package:flutter/services.dart';

class UIHelper {
  static void enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  static void exitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
