import 'dart:convert';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LocalStorageData extends GetxController {
  setUserData(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //to send an object to sharedPreference
    prefs.setString(USER_DATA_KEY, json.encode(userModel.toJson()));
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(USER_DATA_KEY);
    return UserModel.fromJson(json.decode(value));
  }

  Future<UserModel> get getUserData async {
    try {
      UserModel userModel = await _getUser();
      return userModel == null ? null : userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
