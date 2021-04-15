class ProductModel {
  String image, title, subTitle, description, price, size, productId;
  String color;

  ProductModel({
    this.image,
    this.title,
    this.description,
    this.price,
    this.color,
    this.size,
    this.subTitle,
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    //to check if map is empty
    if (map == null) return;

    title = map['title'];
    description = map['description'];
    price = map['price'];
    image = map['image'];
    color = map['color'];
    size = map['size'];
    subTitle = map['subTitle'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'price': price,
      'image': image,
      'color': color,
      'size': size,
      'productId': productId,
    };
  }
}
