import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/view/widgets/best_selling_card.dart';
import 'package:ecommerce_app/view/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 250,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 15,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        child: CustomBestSellingCard(
                          height: 180,
                          title: controller.cartProductList[index].name,
                          price: controller.cartProductList[index].price,
                          isVisibleSubTitle: false,
                          image: controller.cartProductList[index].image,
                        ),
                      );
                    },
                    itemCount: controller.cartProductList.length,
                  ),
                ),
                CustomTitleText(
                  title: 'Shipping Address',
                  fontSize: 26,
                  bottomPadding: 15,
                ),
                GetBuilder<CheckoutViewModel>(
                  init: Get.find(),
                  builder: (controller) => Container(
                    width: Get.width * 0.6,
                    child: Text(
                      controller.street1 +
                          ',' +
                          controller.street2 +
                          ',' +
                          controller.city +
                          ', ' +
                          controller.state +
                          ', ' +
                          controller.country +
                          ', ',
                      style: TextStyle(color: Colors.black54, fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
