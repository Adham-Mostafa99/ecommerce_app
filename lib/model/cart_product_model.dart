import 'package:ecommerce_app/constants.dart';

class CartProductModel {
  String image, name, price, productId;
  int quantity;

  CartProductModel(
      {this.image, this.price, this.quantity, this.name, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    //to check if map is empty
    if (map == null) return;

    price = map[kColumnPrice];
    name = map[kColumnName];
    image = map[kColumnImage];
    quantity = map[kColumnQuantity];
    productId = map[kColumnProductId];
  }

  toJson() {
    return {
      kColumnName: name,
      kColumnPrice: price,
      kColumnImage: image,
      kColumnQuantity: quantity,
      kColumnProductId: productId,
    };
  }
}
