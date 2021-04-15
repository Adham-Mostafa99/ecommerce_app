import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  CustomListTile({this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: kMainColor,
        ),
        title: Text(title),
        trailing: Icon(
            // Icons.arrow_forward_ios,
            Icons.navigate_next),
      ),
    );
  }
}
