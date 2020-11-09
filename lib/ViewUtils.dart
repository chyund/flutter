import 'package:flutter/material.dart';
import 'dart:math';

class RoundImage extends StatelessWidget {
  final bool showDot;
  final double width;
  final String imageSrc;

  RoundImage({this.showDot = false, this.width = 40, this.imageSrc = "images/avatar.jpeg"});

  @override
  Widget build(BuildContext context) {
    if(!showDot) {
      return Center(
        child: ClipOval(
          child: Image(
            image: AssetImage(imageSrc),
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      final radius = width / 10;
      final bigRadius = width / 2;
      final r1 = bigRadius / sqrt2;
      final r2 = radius / sqrt2;
      final totalWidth = bigRadius + r1 + r2 + radius + 2;
      final left = bigRadius + r1 - radius + r2 + 2;
      final top = totalWidth - width;

      return Container(
        width: totalWidth,
        height: totalWidth,
        child: Stack(
          children: [
            Positioned(
              child: ClipOval(
                child: Image(
                  image: AssetImage(imageSrc),
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              top: top,
            ),
            Positioned(
              child: Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(radius)
                ),
              ),
              left: left,
            )
          ],
        ),
      );
    }
  }
}

class RectangleText extends StatelessWidget{
  final Color strokeColor;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final String text;
  final double width;
  final double height;
  final double strokeWidth;

  RectangleText({this.strokeColor = Colors.transparent, this.strokeWidth = 2,
    this.fillColor = Colors.transparent,
    this.textColor = Colors.black, this.textSize = 18,
    @required this.text, this.width = 100, this.height = 30});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
                color: strokeColor,
                width: strokeWidth,
                style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular((height*2+textSize) / 2)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize,
                color: textColor,
                fontWeight: FontWeight.bold
            ),
          ),
        )
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class MyFloatButton extends StatelessWidget{
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onPressed;
  final Color color;

  MyFloatButton({this.width=50, this.height=50, this.child, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height/2),
          gradient: LinearGradient(colors:[Color(0xff005EBC),Color(0xff003087)],begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: child,
      ),
    );
  }

}