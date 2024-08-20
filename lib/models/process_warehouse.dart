part '../parts/process_warehouse.dart';

class ProcessWarehouse {
  String? status;
  int? weight;
  String? date;

  ProcessWarehouse({
    this.status,
    this.weight,
    this.date,
  });
  factory ProcessWarehouse.fromJson(Map<String, dynamic> json) =>
      _$ProcessWarehouseFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessWarehouseToJson(this);
}
