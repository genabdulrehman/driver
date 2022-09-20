import 'dart:convert';

class ChooseAreaModel {
  String stationName;
  String distance;
  String riders;
  String drivers;
  ChooseAreaModel({
    required this.stationName,
    required this.distance,
    required this.riders,
    required this.drivers,
  });

  Map<String, dynamic> toMap() {
    return {
      'stationName': stationName,
      'distance': distance,
      'riders': riders,
      'drivers': drivers,
    };
  }

  factory ChooseAreaModel.fromMap(Map<String, dynamic> map) {
    return ChooseAreaModel(
      stationName: map['stationName'] ?? '',
      distance: map['distance'] ?? '',
      riders: map['riders'] ?? '',
      drivers: map['drivers'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChooseAreaModel.fromJson(String source) =>
      ChooseAreaModel.fromMap(json.decode(source));
}
