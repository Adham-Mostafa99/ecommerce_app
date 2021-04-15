import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  final double topPadding;
  final double bottomPadding;

  CustomTitleText(
      {this.title,
      this.fontSize = 20,
      this.bottomPadding = 30,
      this.topPadding = 35});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize),
        ));
  }
}
