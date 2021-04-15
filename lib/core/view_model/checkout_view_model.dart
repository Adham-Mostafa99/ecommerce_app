import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class CheckoutViewModel extends GetxController {
  int get processIndex => _processIndex;
  int _processIndex = 0;

  String street1, street2, city, state, country;
  // GlobalKey<FormState> formState = GlobalKey();
  final formState = GlobalKey<FormState>();

  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return kStatusChangeColor;
    } else {
      return todoColor;
    }
  }

  void changePages(int index) {
    // _processIndex++

    if (index <= _processIndex) {
      if (index == 0) {
        _pages = Pages.DeliveryTime;
        _processIndex = index;
      } else if (index == 1) {
        _pages = Pages.AddAddress;
        _processIndex = index;
      } else {}
      update();
      return;
    }

    //TODO: there is a problem when i use back bottom , solve it
    if (index == 1) {
      _pages = Pages.AddAddress;
      _processIndex = index;
    } else if (index == 2) {
      formState.currentState.save();
      if (formState.currentState.validate()) {
        _pages = Pages.Summary;
        _processIndex = index;
      }
    } else if (index == 3) {
      //   update();
      Get.to(ControlView());
      _processIndex = 0;
      _pages = Pages.DeliveryTime;
    }
    update();
  }
}
