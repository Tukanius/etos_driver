import 'package:etos_driver/models/customer.dart';
import 'package:etos_driver/models/process_change_agv.dart';
import 'package:etos_driver/models/process_clearance.dart';
import 'package:etos_driver/models/process_custom_zone.dart';
import 'package:etos_driver/models/process_export.dart';
import 'package:etos_driver/models/process_truck_exit.dart';
import 'package:etos_driver/models/process_warehouse.dart';
import 'package:etos_driver/models/receipt.dart';
import 'package:etos_driver/models/truck_scales.dart';
part "../parts/process.dart";

class SetProcess {
  ProcessWarehouse? processWarehouse;
  ProcessClearance? processClearance;
  ProcessCustomZone? processCustomZone;
  ProcessChangeAgv? processChangeAgv;
  ProcessExport? processExport;
  ProcessTruckExit? processTruckExit;
  int? scaledWeight;
  int? vehicleWeight;
  int? netWeight;
  int? invalidWeight;
  String? code;
  String? id;
  Customer? customer;
  Receipt? receipt;
  String? vehiclePlateNumber;
  String? vehicleRfid;
  String? truckScale;
  List<TruckScales>? truckScales;
  String? exportItemStatus;
  String? exportItemStatusDate;
  String? createdAt;
  String? updatedAt;
  ProcessCustomZone? processTruck;

  SetProcess({
    this.processWarehouse,
    this.processClearance,
    this.processCustomZone,
    this.processChangeAgv,
    this.processExport,
    this.processTruckExit,
    this.scaledWeight,
    this.vehicleWeight,
    this.netWeight,
    this.invalidWeight,
    this.id,
    this.code,
    this.customer,
    this.receipt,
    this.vehiclePlateNumber,
    this.vehicleRfid,
    this.truckScale,
    this.truckScales,
    this.exportItemStatus,
    this.exportItemStatusDate,
    this.createdAt,
    this.updatedAt,
    this.processTruck,
  });
  static $fromJson(Map<String, dynamic> json) => _$ProcessFromJson(json);

  factory SetProcess.fromJson(Map<String, dynamic> json) =>
      _$ProcessFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessToJson(this);
}
