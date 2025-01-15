import 'package:flutter/material.dart';

class AnimatedPageIndicatorFb1 extends StatelessWidget {
  const AnimatedPageIndicatorFb1(
      {super.key,
      required this.currentPage,
      required this.numPages,
      this.dotHeight = 10,
      this.activeDotHeight = 10,
      this.dotWidth = 10,
      this.activeDotWidth = 20,
      this.inactiveColor = Colors.grey,
      this.activeColor = const Color(0xFF1976D2)});

  final int
      currentPage; //the index of the active dot, i.e. the index of the page you're on
  final int
      numPages; //the total number of dots, i.e. the number of pages your displaying

  final double dotWidth; //the width of all non-active dots
  final double activeDotWidth; //the width of the active dot
  final double activeDotHeight; //the height of the active dot
  final double dotHeight; //the height of all dots
  final Color inactiveColor; //the gradient of all non-active dots
  final Color activeColor; //the gradient of the active dot

  double _calcRowSize() {
    //Calculates the size of the outer row that creates spacing that is equivalent to the width of a dot
    final int widthFactor = 4; //assuming spacing is equal to the width of a dot
    return (dotWidth * numPages * widthFactor) + activeDotWidth - dotWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _calcRowSize(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          numPages,
          (index) => AnimatedPageIndicatorDot(
            isActive: currentPage == index,
            inactiveColor: inactiveColor,
            activeColor: activeColor,
            activeWidth: activeDotWidth,
            activeHeight: activeDotHeight,
          ),
        ),
      ),
    );
  }
}

class AnimatedPageIndicatorDot extends StatelessWidget {
  const AnimatedPageIndicatorDot(
      {super.key,
      required this.isActive,
      this.height = 10,
      this.width = 50,
      this.activeWidth = 20,
      this.activeHeight = 10,
      required this.inactiveColor,
      required this.activeColor});

  final bool isActive;
  final double height;
  final double width;
  final double activeWidth;
  final double activeHeight;
  final Color inactiveColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? activeWidth : width,
      height: isActive ? activeHeight : height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
    );
  }
}
