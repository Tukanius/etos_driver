part of '../models/process_custom_zone.dart';

ProcessCustomZone _$ProcessCustomZoneFromJson(Map<String, dynamic> json) {
  return ProcessCustomZone(
    status: json['status'] != null ? json['status'] as String : null,
    date: json['date'] != null ? json['date'] as String : null,
  );
}

Map<String, dynamic> _$ProcessCustomZoneToJson(ProcessCustomZone instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.date != null) json['date'] = instance.date;

  return json;
}
