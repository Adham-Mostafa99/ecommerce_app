import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view/checkout/checkout_view.dart';
import 'package:ecommerce_app/view/widgets/custom_colorful_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

//TODO: handle increment and decrement button
class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => controller.cartProductList.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/empty_list.svg',
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'empty cart',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),
                )
              ],
            )
          : Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: (Container(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 25),
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Image.network(
                                    //  'assets/images/${pic[index]}.png',
                                    controller.cartProductList[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartProductList[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        //  fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$${controller.cartProductList[index].price.toString()}',

                                      // '\$230',
                                      style: TextStyle(
                                          color: Colors.teal[600],
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      height: 40,
                                      color: Colors.grey.shade300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.add),
                                            onTap: () => controller
                                                .increaseQuantity(index),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            controller
                                                .cartProductList[index].quantity
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: Icon(Icons.minimize),
                                            ),
                                            onTap: () => controller
                                                .decreaseQuantity(index),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cartProductList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade600),
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => Text(
                                '\$${controller.totalPrice.toString()}',
                                //'\$450 ',
                                style: TextStyle(
                                    color: Colors.teal[600], fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        CustomColorfulButton(
                          padding: 13,
                          title: 'CHECKOUT',
                          onPressed: () {
                            Get.to(CheckoutView());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
