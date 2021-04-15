import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModelList => _categoryModelList;
  List<CategoryModel> _categoryModelList = [];

  List<ProductModel> get productModelList => _productModelList;
  List<ProductModel> _productModelList = [];

  //constructor call getCategory function once we create object
  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    //TODO: progress bar
    HomeService().getDocCategory().then(
      (value) {
        for (int i = 0; i < value.length; i++) {
          _categoryModelList.add(
            CategoryModel.fromJson(
              value[i].data(),
            ),
          );
          _loading.value = false;
        }
        update();
      },
    );
    //.then((value) => _loading.value = false);
    //update();
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getDocBesSellingProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModelList.add(
          ProductModel.fromJson(
            value[i].data(),
          ),
        );
        _loading.value = false;
        //  print(_productModelList.length);
      }
      update();
    });
    //.then((value) => _loading.value = false);
    //update();
  }
}
