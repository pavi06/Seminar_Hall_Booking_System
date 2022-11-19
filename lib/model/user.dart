class UserModel{
  String uid;
  String email;
  String name;
  String phoneNo;

  UserModel({this.uid, this.email, this.name, this.phoneNo});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    uid=json['uid'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phoneNo': phoneNo,
    'uid': uid,
  };
}