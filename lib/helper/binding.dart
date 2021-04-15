import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:get/get.dart';

//TODO: search
class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckoutViewModel());

    ///
    Get.lazyPut(() => LocalStorageData());
  }
}
