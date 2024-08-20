part '../parts/process_clearance.dart';

class ProcessClearance {
  String? status;
  bool? isClearance;
  String? clearanceType;
  int? totalWeight;
  String? date;

  ProcessClearance({
    this.status,
    this.isClearance,
    this.clearanceType,
    this.totalWeight,
    this.date,
  });
  factory ProcessClearance.fromJson(Map<String, dynamic> json) =>
      _$ProcessClearanceFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessClearanceToJson(this);
}
