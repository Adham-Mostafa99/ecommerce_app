import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: search for Form

    return GetBuilder<CheckoutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kMainColor),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.check,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Billing address is the same as delivery address',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    onSaved: (value) {
                      controller.street1 = value;
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'You must write your street name';
                      }
                    },
                    title: 'Street 1',
                    hint: '21, Alex Davidson Avenue',
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    onSaved: (value) {
                      controller.street2 = value;
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'You must write your street name';
                      }
                    },
                    title: 'Street 2',
                    hint: 'Opposite Omegatron, Vicent Quarters',
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    onSaved: (value) {
                      controller.city = value;
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'You must write your city';
                      }
                    },
                    title: 'City',
                    hint: 'Victoria Island',
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            onSaved: (value) {
                              controller.state = value;
                            },
                            validator: (String val) {
                              if (val.isEmpty) {
                                return 'You must write your state';
                              }
                            },
                            title: 'State',
                            hint: 'Lagos State',
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            onSaved: (value) {
                              controller.country = value;
                            },
                            validator: (String val) {
                              if (val.isEmpty) {
                                return 'You must write your country';
                              }
                            },
                            title: 'Country',
                            hint: 'Nigeria',
                          ),
                        ),
                      ],
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
