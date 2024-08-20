part of '../models/truck_scales.dart';

TruckScales _$TruckScalesFromJson(Map<String, dynamic> json) {
  return TruckScales(
    id: json['_id'] != null ? json['_id'] as String : null,
    code: json['code'] != null ? json['code'] as String : null,
    type: json['type'] != null ? json['type'] as String : null,
    weighingTime:
        json['weighingTime'] != null ? json['weighingTime'] as String : null,
    scaleCode: json['scaleCode'] != null ? json['scaleCode'] as String : null,
    vehiclePlateNumber: json['vehiclePlateNumber'] != null
        ? json['vehiclePlateNumber'] as String
        : null,
    vehicleRfid:
        json['vehicleRfid'] != null ? json['vehicleRfid'] as String : null,
    containerNumbers: json['containerNumbers'] != null
        ? (json['containerNumbers'] as List)
            .map((item) => item as String)
            .toList()
        : null,
    containerRfids: json['containerRfids'] != null
        ? (json['containerRfids'] as List)
            .map((item) => item as String)
            .toList()
        : null,
    scaledWeight:
        json['scaledWeight'] != null ? json['scaledWeight'] as String : null,
    vehicleWeight:
        json['vehicleWeight'] != null ? json['vehicleWeight'] as String : null,
    netWeight: json['netWeight'] != null ? json['netWeight'] as String : null,
    platformScaleName: json['platformScaleName'] != null
        ? json['platformScaleName'] as String
        : null,
    remarks: json['remarks'] != null ? json['remarks'] as String : null,
    truckType: json['truckType'] != null ? json['truckType'] as String : null,
    invalidWeight:
        json['invalidWeight'] != null ? json['invalidWeight'] as int : null,
    sort: json['sort'] != null ? json['sort'] as String : null,
    receipt: json['receipt'] != null ? json['receipt'] as String : null,
    detect: json['detect'] != null ? json['detect'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
  );
}

Map<String, dynamic> _$TruckScalesToJson(TruckScales instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['_id'] = instance.id;
  if (instance.code != null) json['code'] = instance.code;
  if (instance.type != null) json['type'] = instance.type;
  if (instance.weighingTime != null) {
    json['weighingTime'] = instance.weighingTime;
  }
  if (instance.scaleCode != null) json['scaleCode'] = instance.scaleCode;
  if (instance.vehiclePlateNumber != null) {
    json['vehiclePlateNumber'] = instance.vehiclePlateNumber;
  }
  if (instance.vehicleRfid != null) json['vehicleRfid'] = instance.vehicleRfid;

  if (instance.containerNumbers != null) {
    json['containerNumbers'] = instance.containerNumbers;
  }
  if (instance.containerRfids != null) {
    json['containerRfids'] = instance.containerRfids;
  }
  if (instance.scaledWeight != null) {
    json['scaledWeight'] = instance.scaledWeight;
  }
  if (instance.vehicleWeight != null) {
    json['vehicleWeight'] = instance.vehicleWeight;
  }
  if (instance.netWeight != null) json['netWeight'] = instance.netWeight;
  if (instance.platformScaleName != null) {
    json['platformScaleName'] = instance.platformScaleName;
  }
  if (instance.remarks != null) json['remarks'] = instance.remarks;
  if (instance.truckType != null) json['truckType'] = instance.truckType;
  if (instance.invalidWeight != null) {
    json['invalidWeight'] = instance.invalidWeight;
  }
  if (instance.sort != null) json['sort'] = instance.sort;
  if (instance.receipt != null) json['receipt'] = instance.receipt;
  if (instance.detect != null) json['detect'] = instance.detect;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;

  return json;
}
