part of '../models/process_change_agv.dart';

ProcessChangeAgv _$ProcessChangeAgvFromJson(Map<String, dynamic> json) {
  return ProcessChangeAgv(
    status: json['status'] != null ? json['status'] as String : null,
    date: json['date'] != null ? json['date'] as String : null,
    tosAgvTruck: json['tosAgvTruck'] != null
        ? TosAgvTruck.fromJson(json['tosAgvTruck'] as Map<String, dynamic>)
        : null,
    tosAgvTruck2: json['tosAgvTruck2'] != null
        ? TosAgvTruck.fromJson(json['tosAgvTruck2'] as Map<String, dynamic>)
        : null,
  );
}

Map<String, dynamic> _$ProcessChangeAgvToJson(ProcessChangeAgv instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.date != null) json['date'] = instance.date;
  if (instance.tosAgvTruck != null) json['tosAgvTruck'] = instance.tosAgvTruck;
  if (instance.tosAgvTruck2 != null) {
    json['tosAgvTruck2'] = instance.tosAgvTruck2;
  }

  return json;
}
