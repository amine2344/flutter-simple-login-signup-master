import 'package:loginSignup/screens/EADashedBoardScreen.dart';
import 'package:loginSignup/utils/EAColors.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EASelectCityScreen.dart';

class EAWalkThroughScreen extends StatefulWidget {
  const EAWalkThroughScreen({super.key});

  @override
  _EAWalkThroughScreenState createState() => _EAWalkThroughScreenState();

  
  
}

class _EAWalkThroughScreenState extends State<EAWalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: walkThroughList.length,
                    itemBuilder: (context, i) {
                      return Image.asset(walkThroughList[i].image!, fit: BoxFit.cover);
                    },
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 40,
                  child: Text('Get Started', style: primaryTextStyle(color: Colors.white)).onTap(() {
                    const EADashedBoardScreen().launch(context);
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(walkThroughList[currentIndexPage].title!, style: boldTextStyle(size: 24, color: white)),
                    16.height,
                    Text(walkThroughList[currentIndexPage].subtitle!, style: primaryTextStyle(color: white), textAlign: TextAlign.center),
                    32.height,
                    DotIndicator(pageController: pageController, pages: walkThroughList, indicatorColor: white),
                    16.height,
                    Text('Make the best experience with your friend in', style: primaryTextStyle(color: white)),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 0.0,
                          width: 150,
                          padding: const EdgeInsets.all(8),
                          color: facebook,
                          onTap: () {
                            const EASelectCityScreen().launch(context);
                          },
                          child: const Icon(Fontisto.facebook, color: white),
                        ),
                        16.width,
                        AppButton(
                          width: 150,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 0.0,
                          padding: const EdgeInsets.all(8),
                          color: twitter,
                          onTap: () {
                            const EASelectCityScreen().launch(context);
                          },
                          child: const Icon(Foundation.social_twitter, color: white),
                        ),
                      ],
                    ),
                  ],
                ).paddingOnly(bottom: 24, right: 16, left: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
