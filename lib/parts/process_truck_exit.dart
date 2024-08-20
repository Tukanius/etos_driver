part of '../models/process_truck_exit.dart';

ProcessTruckExit _$ProcessTruckExitFromJson(Map<String, dynamic> json) {
  return ProcessTruckExit(
    status: json['status'] != null ? json['status'] as String : null,
    date: json['date'] != null ? json['date'] as String : null,
  );
}

Map<String, dynamic> _$ProcessTruckExitToJson(ProcessTruckExit instance) {
  Map<String, dynamic> json = {};
  if (instance.status != null) json['status'] = instance.status;
  if (instance.date != null) json['date'] = instance.date;

  return json;
}
