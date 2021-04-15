import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          _customBottomNavigationBarItem(
            activeIcon: 'Explore',
            icon: 'assets/images/Icon_Explore.png',
          ),
          _customBottomNavigationBarItem(
            activeIcon: 'Cart',
            icon: 'assets/images/Icon_Cart.png',
          ),
          _customBottomNavigationBarItem(
            activeIcon: 'Account',
            icon: 'assets/images/Icon_User.png',
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        selectedItemColor: Colors.black,
      ),
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      {String activeIcon, String icon}) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          activeIcon,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      label: '',
      icon: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Image.asset(
          icon,
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
    );
  }
}
