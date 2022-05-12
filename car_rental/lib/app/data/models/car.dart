class Car {
  String brandid;
  String? brandname;
  String model;
  double price, rating;
  int people;
  int bags;
  int power;
  String condition;
  List<String> images;

  Car({
    required this.brandid,
    required this.model,
    this.price = 0,
    this.condition = "daily",
    required this.images,
    this.people = 4,
    this.bags = 2,
    this.power = 0,
    this.rating = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'brand': brandid,
      'model': model,
      'price': price,
      'condition': condition,
      'images': images,
      'people': people,
      'bags': bags,
      'power': power,
      "rating": rating,
    };
  }

  static Car fromMap(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>;
    return Car(
      brandid: json['brand'] as String? ?? 'Default Brand',
      model: json['model'] as String? ?? 'Default Model',
      price: double.tryParse(json['price']) ?? 0.0,
      condition: json['condition'] as String,
      images: images.map((image) => image as String).toList(),
      people: int.tryParse("${json['people']}") ?? 4,
      bags: int.tryParse("${json['bags']}") ?? 2,
      power: int.tryParse("${json['power']}") ?? 0,
      rating: double.tryParse("${json['rating']}") ?? 0.0,
    );
  }
}
