class UserModel {
  String email, userId, name, pic;

  UserModel({this.email, this.userId, this.name, this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    //to check if map is empty
    if (map == null) return;

    userId = map['userId'];
    email = map['email'];
    pic = map['pic'];
    name = map['name'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'pic': pic,
      'name': name,
    };
  }
}
