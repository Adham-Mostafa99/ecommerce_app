import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => SafeArea(
        child: controller.loading.value == true
            ? Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kMainColor),
              ))
            : Scaffold(
                body: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              //'https://www.woolha.com/media/2020/03/eevee.png',
                              controller.userModel.pic == null ||
                                      controller.userModel.pic == ''
                                  ? 'https://www.woolha.com/media/2020/03/eevee.png'
                                  : controller.userModel.pic),
                          minRadius: 50,
                          maxRadius: 75,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              controller.userModel.name,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 220,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  controller.userModel.email,
                                  // 'email',
                                  //'email@gmail.com',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CustomListTile(title: 'Edit Profile', icon: Icons.edit),
                        CustomListTile(
                            title: 'Shipping Address', icon: Icons.location_on),
                        CustomListTile(
                            title: 'Order History', icon: Icons.history),
                        CustomListTile(title: 'Cards', icon: Icons.credit_card),
                        CustomListTile(
                            title: 'Notifications',
                            icon: Icons.notifications_outlined),
                        CustomListTile(
                          title: 'Log Out',
                          icon: Icons.logout,
                          onTap: () {
                            controller.signOut();

                            ///
                            //Get.offAll(LoginView());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
