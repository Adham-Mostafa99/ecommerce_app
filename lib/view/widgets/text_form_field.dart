import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;

  final Function onSaved;
  final Function validator;

  CustomTextFormField({this.title, this.hint, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade800,
          ),
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    ));
  }
}
