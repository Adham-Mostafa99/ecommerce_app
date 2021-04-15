import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widgets/best_selling_card.dart';
import 'package:ecommerce_app/view/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value == true
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kMainColor),
              ),
            )
          : Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 70, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchTextFormField(),
                    CustomTitleText(
                      title: 'Categories',
                    ),
                    _listViewCategory(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTitleText(
                          title: 'Best Selling',
                          bottomPadding: 20,
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    _listViewProduct(context),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 110,
        child: ListView.separated(
          //itemCount: names.length,
          itemCount: controller.categoryModelList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  height: 65,
                  width: 65,
                  //child: Image.asset('assets/images/${pic[index]}.png'),
                  child:
                      Image.network(controller.categoryModelList[index].image),
                ),
                Text(
                  // names[index],
                  controller.categoryModelList[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 4,
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      //init: Get.find(),
      builder: (controller) => Container(
        height: 335,
        child: GridView.count(
          childAspectRatio: 0.62,
          //itemCount: controller.productModelList.length,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: List.generate(
            controller.productModelList.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    DetailsView(
                      model: controller.productModelList[index],
                    ),
                  );
                },
                child: CustomBestSellingCard(
                  image: controller.productModelList[index].image,
                  price: controller.productModelList[index].price,
                  subTitle: controller.productModelList[index].subTitle,
                  title: controller.productModelList[index].title,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
