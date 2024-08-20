part of '../models/process_clearance.dart';

ProcessClearance _$ProcessClearanceFromJson(Map<String, dynamic> json) {
  return ProcessClearance(
    status: json['status'] != null ? json['status'] as String : null,
    isClearance:
        json['isClearance'] != null ? json['isClearance'] as bool : null,
    clearanceType:
        json['clearanceType'] != null ? json['clearanceType'] as String : null,
    date: json['date'] != null ? json['date'] as String : null,
    totalWeight:
        json['totalWeight'] != null ? json['totalWeight'] as int : null,
  );
}

Map<String, dynamic> _$ProcessClearanceToJson(ProcessClearance instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.isClearance != null) json['isClearance'] = instance.isClearance;
  if (instance.clearanceType != null) {
    json['clearanceType'] = instance.clearanceType;
  }
  if (instance.date != null) json['date'] = instance.date;
  if (instance.totalWeight != null) json['totalWeight'] = instance.totalWeight;

  return json;
}
