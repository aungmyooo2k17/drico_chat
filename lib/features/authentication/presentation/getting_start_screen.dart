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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 64.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                    width: 64.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/profile${index + 1}.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 6.0, left: 6.0),
                              width: 64.0,
                              height: 64.0,
                              decoration: const BoxDecoration(
                                color: Color(0xff7c94b6),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Abdul Magdi",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  "Where have you been?",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12:00 PM",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const Icon(
                            Icons.done,
                            color: Colors.blue,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
