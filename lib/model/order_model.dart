import 'package:ecommerce_app/model/cart_product_model.dart';

class OrderModel {
  String userId, dateTime;
  Address address;
  List<CartProductModel> products;

  OrderModel({this.userId, this.dateTime, this.address, this.products});

  Map<String, dynamic> toMap() {
    return {
      'address': this.address,
      'dateTime': this.dateTime,
      'userId': this.userId,
      'products': this.products,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return new OrderModel(
      address: map['address'] as Address,
      dateTime: map['dateTime'] as String,
      userId: map['userId'] as String,
      products: map['products'] as List<CartProductModel>,
    );
  }
}

class Address {
  String street1, street2, city, state, country;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'street1': this.street1,
      'street2': this.street2,
      'city': this.city,
      'state': this.state,
      'country': this.country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return new Address(
      city: map['city'],
      country: map['country'],
      state: map['state'],
      street1: map['street1'],
      street2: map['street2'],
    );
  }
}
