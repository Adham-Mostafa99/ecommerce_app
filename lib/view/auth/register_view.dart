import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/widgets/custom_colorful_button.dart';
import 'package:ecommerce_app/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 15,
              right: 15,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: 'Name',
                    hint: 'David Spade',
                    onSaved: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null) print('error');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    hint: 'iamdavid@gmail.com',
                    onSaved: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) print('error');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: 'Password',
                    hint: '***************',
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) print('error');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: CustomColorfulButton(
                      title: 'SIGN UP',
                      onPressed: () {
                        _formKey.currentState.save();

                        if (_formKey.currentState.validate())
                          controller.createAccountWithEmailAndPassword();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
