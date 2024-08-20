part of '../models/process_export.dart';

ProcessExport _$ProcessExportFromJson(Map<String, dynamic> json) {
  return ProcessExport(
    status: json['status'] != null ? json['status'] as String : null,
    date: json['date'] != null ? json['date'] as String : null,
    tosAgvTrucks: json["tosAgvTrucks"] != null
        ? (json["tosAgvTrucks"] as List).map((item) => item as String).toList()
        : null,
  );
}

Map<String, dynamic> _$ProcessExportToJson(ProcessExport instance) {
  Map<String, dynamic> json = {};
  if (instance.tosAgvTrucks != null) {
    json['tosAgvTrucks'] = instance.tosAgvTrucks;
  }
  if (instance.status != null) json['status'] = instance.status;
  if (instance.date != null) json['date'] = instance.date;
  return json;
}
