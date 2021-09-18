import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Center(
        child: Text(
          'You Are ON Page No. $index',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}
