class Brand {
  String uid;
  String name;
  String image;

  Brand({
    required this.uid,
    required this.name,
    required this.image,
  });

  static Brand fromMap(Map<String, dynamic> json) {
    return Brand(
      uid: json['uid'],
      name: json['name'] as String? ?? 'Default Brand',
      image: json['image'] as String? ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT4gKDtP_saQcsAuBukz2OlfjtOh9DDMI9Edtb1iAfA_2-GI39chp5exgrelld5ViOdZw&usqp=CAU',
    );
  }

  tojson() {
    return {
      'uid': uid,
      'name': name,
      'image': image,
    };
  }
}
