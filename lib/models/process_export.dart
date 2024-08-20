part '../parts/process_export.dart';

class ProcessExport {
  List<String>? tosAgvTrucks;
  String? status;
  String? date;

  ProcessExport({
    this.tosAgvTrucks,
    this.status,
    this.date,
  });
  factory ProcessExport.fromJson(Map<String, dynamic> json) =>
      _$ProcessExportFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessExportToJson(this);
}
