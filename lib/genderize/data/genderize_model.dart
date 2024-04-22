class GenderizeModel {
  final int count;
  final String name;
  final String gender;
  final double probability;

  GenderizeModel({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory GenderizeModel.fromJson(Map<String, dynamic> json) {
    return GenderizeModel(
      count: json['count'],
      name: json['name'],
      gender: json['gender'],
      probability: json['probability'],
    );
  }
}
