import 'package:flutter/material.dart';
import 'package:loginui/screens/onboarding/onboarding_models.dart';

import 'drawer_paint.dart';

class OnboardingPage extends StatefulWidget {
  final PageController pageController;

  const OnboardingPage(
      {Key? key, required this.pageController, required this.onboardModel})
      : super(key: key);

  final OnboardPageModel onboardModel;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _borderAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: -30, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
    _borderAnimation = Tween<double>(begin: 65, end: 50)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.onboardModel.primeColor,
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Image.asset(widget.onboardModel.imagePath),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.onboardModel.caption,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: widget.onboardModel.accentColor),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Some Header',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: widget.onboardModel.accentColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        widget.onboardModel.description,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: widget.onboardModel.accentColor
                                .withOpacity(0.6)),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
              animation: _borderAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter:
                      DrawerPaint(curveColor: widget.onboardModel.accentColor),
                  child: SizedBox(
                    width: _borderAnimation.value,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconButton(
                          onPressed: nextButtonPressed,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  void nextButtonPressed() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
