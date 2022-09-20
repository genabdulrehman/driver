import 'dart:convert';

class PickupModel {
  String title;
  String streetName;
  String distance;
  String duration;
  PickupModel({
    required this.title,
    required this.streetName,
    required this.distance,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'streetName': streetName,
      'distance': distance,
      'duration': duration,
    };
  }

  factory PickupModel.fromMap(Map<String, dynamic> map) {
    return PickupModel(
      title: map['title'] ?? '',
      streetName: map['streetName'] ?? '',
      distance: map['distance'] ?? '',
      duration: map['duration'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PickupModel.fromJson(String source) =>
      PickupModel.fromMap(json.decode(source));
}
