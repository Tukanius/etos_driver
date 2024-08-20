part of '../models/tos_agv.dart';

TosAgvTruck _$TosAgvTruckFromJson(Map<String, dynamic> json) {
  return TosAgvTruck(
    status: json['status'] != null ? json['status'] as String : null,
    isClearance:
        json['isClearance'] != null ? json['isClearance'] as bool : null,
    clearanceType:
        json['clearanceType'] != null ? json['clearanceType'] as String : null,
    totalWeight:
        json['totalWeight'] != null ? json['totalWeight'] as int : null,
    date: json['date'] != null ? json['date'] as String : null,
  );
}

Map<String, dynamic> _$TosAgvTruckToJson(TosAgvTruck instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.isClearance != null) json['isClearance'] = instance.isClearance;
  if (instance.clearanceType != null) {
    json['clearanceType'] = instance.clearanceType;
  }
  if (instance.totalWeight != null) json['totalWeight'] = instance.totalWeight;
  if (instance.date != null) json['date'] = instance.date;

  return json;
}
