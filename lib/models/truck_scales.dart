part '../parts/truck_scales.dart';

class TruckScales {
  String? id;
  String? code;
  String? type;
  String? weighingTime;
  String? scaleCode;
  String? vehiclePlateNumber;
  String? vehicleRfid;
  List<String>? containerNumbers;
  List<String>? containerRfids;
  String? scaledWeight;
  String? vehicleWeight;
  String? netWeight;
  String? platformScaleName;
  String? remarks;
  String? truckType;
  int? invalidWeight;
  String? sort;
  String? receipt;
  String? detect;
  String? createdAt;
  String? updatedAt;

  TruckScales({
    this.id,
    this.code,
    this.type,
    this.weighingTime,
    this.scaleCode,
    this.vehiclePlateNumber,
    this.vehicleRfid,
    this.containerNumbers,
    this.containerRfids,
    this.scaledWeight,
    this.vehicleWeight,
    this.netWeight,
    this.platformScaleName,
    this.remarks,
    this.truckType,
    this.invalidWeight,
    this.sort,
    this.receipt,
    this.detect,
    this.createdAt,
    this.updatedAt,
  });
  factory TruckScales.fromJson(Map<String, dynamic> json) =>
      _$TruckScalesFromJson(json);
  Map<String, dynamic> toJson() => _$TruckScalesToJson(this);
}
