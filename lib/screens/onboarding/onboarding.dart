import 'package:coinpay/utils/constants.dart';
import 'package:coinpay/widgets/animations.dart';
import 'package:coinpay/widgets/sliding_images.dart';
import 'package:flutter/material.dart';

import '../../commons.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isActive = true;
  List<Widget> images = [
    const SlidingImages('assets/images/first onboarding.jpg'),
    const SlidingImages('assets/images/second onboarding.jpg'),
    const SlidingImages('assets/images/final onboarding.jpg'),
  ];

  List<String> texts = [
    'Trusted by millions of people, part of one part',
    'Spend money abroad, and track your expense',
    'Receive Money From Anywhere in The World',
  ];

  late PageController _pageController;
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: double.infinity,
        leading: Divider(
          thickness: 2.5,
          color: Colors.deepOrange.shade300,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    _position = index;
                  });
                },
                itemBuilder: (context, position) {
                  return imageSlider(position);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimatedPageIndicatorFb1(
              currentPage: _position,
              numPages: images.length,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.02),
              child: Text(
                texts[_position],
                style: kOnboardingTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(kAppDefaultColor),
                padding: getButtonPadding(context),
              ),
              onPressed: () {
                if (_position < images.length - 1) {
                  _pageController.animateToPage(
                    _position + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.06,
            bottom: MediaQuery.of(context).size.width * 0.05),
        child: Divider(
          thickness: 2.0,
          color: Colors.deepOrange.shade300,
        ),
      ),
    );
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, widget) {
          return Center(
            child: widget,
          );
        },
        child: Container(
          child: images[position],
        ));
  }
}
