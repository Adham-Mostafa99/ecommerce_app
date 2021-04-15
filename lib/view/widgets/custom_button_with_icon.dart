import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function onPressed;

  CustomButtonWithIcon({this.title, this.iconPath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        padding: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(iconPath),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
