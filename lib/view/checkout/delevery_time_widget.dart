import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery _delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: Get.find(),
      builder: (controller) => Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              trailing: Radio(
                value: Delivery.StandardDelivery,
                groupValue: _delivery,
                onChanged: (value) {
                  setState(() {
                    _delivery = value;
                  });
                },
                activeColor: kStatusChangeColor,
              ),
              title: Text(
                'Standard Delivery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '\nOrder will be delivered between 3 - 5 business days',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              trailing: Radio(
                value: Delivery.NextDayDelivery,
                groupValue: _delivery,
                onChanged: (value) {
                  setState(() {
                    _delivery = value;
                  });
                },
                activeColor: kStatusChangeColor,
              ),
              title: Text(
                'Next Day Delivery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '\nPlace your order before 6pm and your items will be delivered the next day',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              trailing: Radio(
                value: Delivery.NominatedDelivery,
                groupValue: _delivery,
                onChanged: (value) {
                  setState(() {
                    _delivery = value;
                  });
                },
                activeColor: kStatusChangeColor,
              ),
              title: Text(
                'Nominated Delivery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '\nPick a particular date from the calendar and order will be delivered on selected date',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
