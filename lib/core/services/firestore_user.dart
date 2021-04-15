import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FireStoreUser {
  //to create collection called Users in cloud
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  //to return all data for specific user depending on his id
  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
