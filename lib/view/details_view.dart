import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_colorful_button.dart';
import 'package:ecommerce_app/view/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;
  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          model.title,
                          style: TextStyle(
                              fontSize: 26,
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(),
                                  Text(
                                    model.size,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                //color: Colors.red,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Colour',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(),
                                  //TODO: change color from firebase == 20
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                //color: Colors.red,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              height: 40,
                            ),
                          ],
                        ),
                        CustomTitleText(
                          topPadding: 20,
                          bottomPadding: 20,
                          title: 'Details',
                        ),
                        Text(
                          model.description,
                          style: TextStyle(fontSize: 20, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Text(
                            '\$${model.price}',
                            style: TextStyle(
                                color: Colors.teal[600],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      CustomColorfulButton(
                        padding: 12,
                        title: 'Add',
                        onPressed: () {
                          controller.addProduct(CartProductModel(
                            name: model.title,
                            image: model.image,
                            price: model.price,
                            quantity: 1,
                            productId: model.productId,
                          ));
                        },
                      )
                    ],
                  ),
                ),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.grey.shade100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
