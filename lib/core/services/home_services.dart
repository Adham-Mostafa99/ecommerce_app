import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getDocCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDocBesSellingProducts() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }
}
