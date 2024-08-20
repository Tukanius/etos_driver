part of '../models/process_warehouse.dart';

ProcessWarehouse _$ProcessWarehouseFromJson(Map<String, dynamic> json) {
  return ProcessWarehouse(
    status: json['status'] != null ? json['status'] as String : null,
    weight: json['weight'] != null ? json['weight'] as int : null,
    date: json['date'] != null ? json['date'] as String : null,
  );
}

Map<String, dynamic> _$ProcessWarehouseToJson(ProcessWarehouse instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.weight != null) json['weight'] = instance.weight;

  return json;
}
