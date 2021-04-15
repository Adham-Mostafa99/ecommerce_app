import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button_with_icon.dart';
import 'package:ecommerce_app/view/widgets/custom_colorful_button.dart';
import 'package:ecommerce_app/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  //TODO: search >> globalKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.off(RegisterView()),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kMainColor,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: CustomColorfulButton(
                      title: 'SIGN IN',
                      onPressed: () {
                        _formKey.currentState.save();

                        if (_formKey.currentState.validate())
                          controller.signInWithEmailAndPassword();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 40),
                    alignment: Alignment.center,
                    child: Text(
                      '-OR-',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  CustomButtonWithIcon(
                    title: 'Sign In with Facebook',
                    iconPath: 'assets/images/facebook.png',
                    onPressed: () => controller.facebookSignIn(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButtonWithIcon(
                    onPressed: () => controller.googleSignIn(),
                    title: 'Sign In with Google',
                    iconPath: 'assets/images/google.png',
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
