import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomColorfulButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double fontSize;
  final double padding;

  CustomColorfulButton({
    this.title,
    this.onPressed,
    this.color = kMainColor,
    this.fontSize = 18,
    this.padding = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(padding),
        color: color,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
