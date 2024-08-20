part of '../models/process.dart';

SetProcess _$ProcessFromJson(Map<String, dynamic> json) {
  return SetProcess(
    processWarehouse: json['processWarehouse'] != null
        ? ProcessWarehouse.fromJson(
            json['processWarehouse'] as Map<String, dynamic>)
        : null,
    processClearance: json['processClearance'] != null
        ? ProcessClearance.fromJson(
            json['processClearance'] as Map<String, dynamic>)
        : null,
    processCustomZone: json['processCustomZone'] != null
        ? ProcessCustomZone.fromJson(
            json['processCustomZone'] as Map<String, dynamic>)
        : null,
    processChangeAgv: json['processChangeAgv'] != null
        ? ProcessChangeAgv.fromJson(
            json['processChangeAgv'] as Map<String, dynamic>)
        : null,
    processExport: json['processExport'] != null
        ? ProcessExport.fromJson(json['processExport'] as Map<String, dynamic>)
        : null,
    processTruckExit: json['processTruckExit'] != null
        ? ProcessTruckExit.fromJson(
            json['processTruckExit'] as Map<String, dynamic>)
        : null,
    scaledWeight:
        json['scaledWeight'] != null ? json['scaledWeight'] as int : null,
    vehicleWeight:
        json['vehicleWeight'] != null ? json['vehicleWeight'] as int : null,
    netWeight: json['netWeight'] != null ? json['netWeight'] as int : null,
    invalidWeight:
        json['invalidWeight'] != null ? json['invalidWeight'] as int : null,
    id: json['_id'] != null ? json['_id'] as String : null,
    code: json['code'] != null ? json['code'] as String : null,
    customer: json['customer'] != null
        ? Customer.fromJson(json['customer'] as Map<String, dynamic>)
        : null,
    receipt: json['receipt'] != null
        ? Receipt.fromJson(json['receipt'] as Map<String, dynamic>)
        : null,
    vehiclePlateNumber: json['vehiclePlateNumber'] != null
        ? json['vehiclePlateNumber'] as String
        : null,
    vehicleRfid:
        json['vehicleRfid'] != null ? json['vehicleRfid'] as String : null,
    truckScale:
        json['truckScale'] != null ? json['truckScale'] as String : null,
    truckScales: json["truckScales"] != null
        ? (json["truckScales"] as List)
            .map((item) => TruckScales.fromJson(item))
            .toList()
        : null,
    exportItemStatus: json['exportItemStatus'] != null
        ? json['exportItemStatus'] as String
        : null,
    exportItemStatusDate: json['exportItemStatusDate'] != null
        ? json['exportItemStatusDate'] as String
        : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    processTruck: json['processTruck'] != null
        ? ProcessCustomZone.fromJson(
            json['processTruck'] as Map<String, dynamic>)
        : null,
  );
}

Map<String, dynamic> _$ProcessToJson(SetProcess instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['_id'] = instance.id;
  if (instance.processWarehouse != null) {
    json['processWarehouse'] = instance.processWarehouse;
  }
  if (instance.processClearance != null) {
    json['processClearance'] = instance.processClearance;
  }
  if (instance.processCustomZone != null) {
    json['processCustomZone'] = instance.processCustomZone;
  }
  if (instance.processChangeAgv != null) {
    json['processChangeAgv'] = instance.processChangeAgv;
  }
  if (instance.processExport != null) {
    json['processExport'] = instance.processExport;
  }
  if (instance.processTruckExit != null) {
    json['processTruckExit'] = instance.processTruckExit;
  }
  if (instance.scaledWeight != null) {
    json['scaledWeight'] = instance.scaledWeight;
  }
  if (instance.vehicleWeight != null) {
    json['vehicleWeight'] = instance.vehicleWeight;
  }
  if (instance.netWeight != null) json['netWeight'] = instance.netWeight;
  if (instance.invalidWeight != null) {
    json['invalidWeight'] = instance.invalidWeight;
  }
  if (instance.receipt != null) json['receipt'] = instance.receipt;
  if (instance.vehiclePlateNumber != null) {
    json['vehiclePlateNumber'] = instance.vehiclePlateNumber;
  }
  if (instance.vehicleRfid != null) json['vehicleRfid'] = instance.vehicleRfid;
  if (instance.truckScale != null) json['truckScale'] = instance.truckScale;
  if (instance.truckScales != null) json['truckScales'] = instance.truckScales;
  if (instance.exportItemStatus != null) {
    json['exportItemStatus'] = instance.exportItemStatus;
  }
  if (instance.exportItemStatusDate != null) {
    json['exportItemStatusDate'] = instance.exportItemStatusDate;
  }
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.processTruck != null) {
    json['processTruck'] = instance.processTruck;
  }

  return json;
}
