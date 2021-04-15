import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double fontSize;
  final double hpadding;
  final double vpadding;

  CustomRoundedButton({
    this.title,
    this.onPressed,
    this.color = kMainColor,
    this.fontSize = 18,
    this.hpadding = 18,
    this.vpadding = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(5),
        // ),
        //

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: color,
            width: 1.4,
          ),
        ),

        padding: EdgeInsets.symmetric(horizontal: hpadding, vertical: vpadding),
        // color: color,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
