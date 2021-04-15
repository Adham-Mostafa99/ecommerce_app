import 'package:ecommerce_app/core/services/database/cart_database_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  //TODO: search
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductList = [];
  List<CartProductModel> get cartProductList => _cartProductList;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDataBaseHelper.dp;
  //so that once i create an instance of this model.. all products are called
  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    //to start loading
    _loading.value = true;

    _cartProductList = await dbHelper.getAllProduct();

    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductList.length; i++) {
      _totalPrice += (double.parse(_cartProductList[i].price) *
          _cartProductList[i].quantity);
      update();
    }
    print(_totalPrice);
  }

  addProduct(CartProductModel cartProductModel) async {
    //to check if this item already added to your list
    for (int i = 0; i < _cartProductList.length; i++) {
      if (_cartProductList[i].productId == cartProductModel.productId) return;
    }
    await dbHelper.insertUser(cartProductModel);
    _cartProductList.add(cartProductModel);

    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductList[index].quantity++;
    _totalPrice += (double.parse(_cartProductList[index].price));

    //to update it in sqlLite
    await dbHelper.updateProduct(_cartProductList[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductList[index].quantity--;
    _totalPrice -= (double.parse(_cartProductList[index].price));
    //to update it in sqlLite
    await dbHelper.updateProduct(_cartProductList[index]);
    update();
  }
}
