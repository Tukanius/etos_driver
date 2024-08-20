part '../parts/tos_agv.dart';

class TosAgvTruck {
  String? status;
  bool? isClearance;
  String? clearanceType;
  int? totalWeight;
  String? date;

  TosAgvTruck({
    this.status,
    this.isClearance,
    this.clearanceType,
    this.totalWeight,
    this.date,
  });
  factory TosAgvTruck.fromJson(Map<String, dynamic> json) =>
      _$TosAgvTruckFromJson(json);
  Map<String, dynamic> toJson() => _$TosAgvTruckToJson(this);
}
