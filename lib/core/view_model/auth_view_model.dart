import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final LocalStorageData _localStorageData = Get.find();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  //var _fLogin = FacebookLogin();
  String email, password, name;

  Rx<User> _user = Rx<User>();

  //observer to get current email of the user
  //notice that _user observe any changes in auth so you can save data in it
  String get user => _user.value?.email;

  //is called once controller is called
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print(_auth.currentUser);

    //to notice changes in auth so that you can know if user is signed in or not
    _user.bindStream(_auth.authStateChanges());

    if (_auth.currentUser != null) {
      //get data from fireStore the save it in sharedPreference
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  //is called once your widget is rendered in the ui
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //TODO: there is an error when you try to sign in for the second time
  void googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    //  UserCredential userCredential =
    await _auth.signInWithCredential(credential).then((data) async {
      saveUser(data);
      Get.offAll(ControlView());
    });
    //   print(userCredential.user);
  }

  //TODO: check the error here = The getter 'token' was called on null
  void facebookSignIn() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    // final accessToken = result.accessToken.token;

    if (result != null) {
      try {
        final faceCredential =
            FacebookAuthProvider.credential(result.accessToken.token);
        final user =
            await _auth.signInWithCredential(faceCredential).then((data) async {
          saveUser(data);
          Get.offAll(ControlView());
        });
        print('done======================> $user');
      } catch (e) {
        print('error =================> $e');
      }
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        //to get users data from firebase so that you can display pic,email,name
        //in profile view
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((data) async {
        saveUser(data);
        Get.offAll(ControlView());
      });
    } catch (e) {
      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential data) async {
    UserModel userModel = UserModel(
      userId: data.user.uid,
      email: data.user.email,
      name: name ?? data.user.displayName,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    _saveDataInShardPref(userModel);
  }

  //
  void _saveDataInShardPref(UserModel userModel) async {
    await _localStorageData.setUserData(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      _saveDataInShardPref(UserModel.fromJson(value.data()));
    });
  }
}
