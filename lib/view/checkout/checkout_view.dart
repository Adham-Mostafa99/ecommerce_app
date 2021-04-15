import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/view/checkout/add_address_widget.dart';
import 'package:ecommerce_app/view/checkout/delevery_time_widget.dart';
import 'package:ecommerce_app/view/checkout/summary_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_colorful_button.dart';
import 'package:ecommerce_app/view/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constants.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.processIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: kStatusChangeColor, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kStatusChangeColor,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.processIndex) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(
                  opacity: controller.processIndex == 0 ? 0 : 1,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25, right: 25),
                      child: CustomRoundedButton(
                        title: 'BACK ',
                        hpadding: 40,
                        vpadding: 20,
                        onPressed: () {
                          controller.changePages(controller.processIndex - 1);
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25, right: 25),
                    child: Container(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        color: kMainColor,
                        onPressed: () {
                          controller.changePages(controller.processIndex + 1);
                        },
                        child: Text(
                          controller.processIndex == 2 ? 'Deliver' : 'NEXT',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    // child: CustomColorfulButton(
                    //   title: 'NEXT ',
                    //   padding: 14,
                    //   onPressed: () {
                    //     controller.changePages(controller.processIndex + 1);
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     margin: EdgeInsets.only(bottom: 25, right: 25),
            //     child: CustomRoundedButton(
            //       title: 'BACK ',
            //       padding: 14,
            //       onPressed: () {
            //         controller.changePages();
            //       },
            //     ),
            //   ),
            // )
          ],
        ),

        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.skip_next),
        //   onPressed: () {
        //     print(controller.processIndex);
        //     controller.changePages();
        //   },
        //   backgroundColor: inProgressColor,
        // ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
