part '../parts/progress_truck.dart';

class ProgressTruck {
  String? id;
  String? type;
  String? name;
  String? createdAt;
  String? updatedAt;

  ProgressTruck({
    this.id,
    this.type,
    this.name,
    this.createdAt,
    this.updatedAt,
  });
  factory ProgressTruck.fromJson(Map<String, dynamic> json) =>
      _$ProgressTruckFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressTruckToJson(this);
}
