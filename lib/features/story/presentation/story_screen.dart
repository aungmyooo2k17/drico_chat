import 'package:drico_chat/common_widgets/app_icon_button_widget.dart';
import 'package:drico_chat/common_widgets/user_info_widget.dart';
import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/story/presentation/story_user_item_widget.dart';
import 'package:drico_chat/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  static String name = "/story";

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Resources.dimensions.paddings.paddingMediumLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: Resources.dimensions.margins.marginMediumLarge,
                        top: Resources.dimensions.margins.marginSmall),
                    height: 4,
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      Resources.dimensions.margins.marginSmall),
                              width: MediaQuery.of(context).size.width / 2,
                              color: Colors.blue,
                            )),
                  ),
                  const StoryUserItem()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
