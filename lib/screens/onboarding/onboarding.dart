import 'package:flutter/material.dart';
import 'package:loginui/screens/onboarding/onboard_data.dart';
import 'onboarding_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: onboardData.length,
          itemBuilder: (context, index) => OnboardingPage(
            pageController: pageController,
            onboardModel: onboardData[index],
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Some Text',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.9),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
