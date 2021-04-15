import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  UserModel _userModel;

  //TODO: ??? what is Get.find()
  final LocalStorageData localStorageData = Get.find();
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserData();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUserData.then((value) {
      _userModel = value;
    }).then((value) => _loading.value = false);
    update();
  }
}
