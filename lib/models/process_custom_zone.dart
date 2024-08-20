part '../parts/process_custom_zone.dart';

class ProcessCustomZone {
  String? status;
  String? date;

  ProcessCustomZone({
    this.status,
    this.date,
  });
  static $fromJson(Map<String, dynamic> json) =>
      _$ProcessCustomZoneFromJson(json);

  factory ProcessCustomZone.fromJson(Map<String, dynamic> json) =>
      _$ProcessCustomZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessCustomZoneToJson(this);
}
