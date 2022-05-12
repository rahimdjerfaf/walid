class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? phone;
  final String photoUrl;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
    this.phone,
  });

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "phone": phone,
        "photoUrl": photoUrl,
      };
}

final defaultUser = UserModel(
  uid: "Deafult",
  email: "email@walid.dz",
  name: "Default",
  photoUrl: "photoUrl",
);
