class MealModel {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final String description;

  MealModel({
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.description,
  });
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'rate': rate,
      'time': time,
      'description': description,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      rate: map['rate']?.toDouble() ?? 0.0,
      time: map['time'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
