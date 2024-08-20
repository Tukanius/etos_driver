// ignore_for_file: curly_braces_in_flow_control_structures

part of '../models/receipt.dart';

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    id: json['_id'] != null ? json['_id'] as String : null,
    customer: json['customer'] != null ? json['customer'] as String : null,
    regCustomer:
        json['regCustomer'] != null ? json['regCustomer'] as String : null,
    contractNo:
        json['contractNo'] != null ? json['contractNo'] as String : null,
    receiptNo: json['receiptNo'] != null ? json['receiptNo'] as String : null,
    receiptDate:
        json['receiptDate'] != null ? json['receiptDate'] as String : null,
    supplierName:
        json['supplierName'] != null ? json['supplierName'] as String : null,
    supplier: json['supplier'] != null ? json['supplier'] as String : null,
    buyerName: json['buyerName'] != null ? json['buyerName'] as String : null,
    productName:
        json['productName'] != null ? json['productName'] as String : null,
    transportName:
        json['transportName'] != null ? json['transportName'] as String : null,
    vehicleRfidNumber: json['vehicleRfidNumber'] != null
        ? json['vehicleRfidNumber'] as String
        : null,
    vehiclePlateNo: json['vehiclePlateNo'] != null
        ? json['vehiclePlateNo'] as String
        : null,
    unladedWeight:
        json['unladedWeight'] != null ? json['unladedWeight'] as int : null,
    ladedWeight:
        json['ladedWeight'] != null ? json['ladedWeight'] as int : null,
    totalWeight:
        json['totalWeight'] != null ? json['totalWeight'] as int : null,
    containerRfid: json["containerRfid"] != null
        ? (json["containerRfid"] as List).map((item) => item as String).toList()
        : null,
    trailerPlateNumbers: json["trailerPlateNumbers"] != null
        ? (json["trailerPlateNumbers"] as List)
            .map((item) => item as String)
            .toList()
        : null,
    driverName:
        json['driverName'] != null ? json['driverName'] as String : null,
    driverPhone:
        json['driverPhone'] != null ? json['driverPhone'] as String : null,
    driverRegisterNo: json['driverRegisterNo'] != null
        ? json['driverRegisterNo'] as String
        : null,
    classC: json['classC'] != null ? json['classC'] as String : null,
    unladadArea:
        json['unladadArea'] != null ? json['unladadArea'] as String : null,
    isClearance:
        json['isClearance'] != null ? json['isClearance'] as bool : null,
    ladedArea: json['ladedArea'] != null ? json['ladedArea'] as String : null,
    containerNumbers: json["containerNumbers"] != null
        ? (json["containerNumbers"] as List)
            .map((item) => item as String)
            .toList()
        : null,
    sealNumbers: json["sealNumbers"] != null
        ? (json["sealNumbers"] as List).map((item) => item as String).toList()
        : null,
    truckScales: json["truckScales"] != null
        ? (json["truckScales"] as List).map((item) => item as String).toList()
        : null,
    receiptStatus:
        json['receiptStatus'] != null ? json['receiptStatus'] as String : null,
    receiptStatusDate: json['receiptStatusDate'] != null
        ? json['receiptStatusDate'] as String
        : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['_id'] = instance.id;
  if (instance.customer != null) json['customer'] = instance.customer;
  if (instance.regCustomer != null) json['regCustomer'] = instance.regCustomer;
  if (instance.contractNo != null) json['contractNo'] = instance.contractNo;
  if (instance.receiptNo != null) json['receiptNo'] = instance.receiptNo;
  if (instance.receiptDate != null) json['receiptDate'] = instance.receiptDate;
  if (instance.supplierName != null)
    json['supplierName'] = instance.supplierName;
  if (instance.supplier != null) json['supplier'] = instance.supplier;
  if (instance.buyerName != null) json['buyerName'] = instance.buyerName;
  if (instance.productName != null) json['productName'] = instance.productName;
  if (instance.transportName != null)
    json['transportName'] = instance.transportName;
  if (instance.vehicleRfidNumber != null)
    json['vehicleRfidNumber'] = instance.vehicleRfidNumber;
  if (instance.vehiclePlateNo != null)
    json['vehiclePlateNo'] = instance.vehiclePlateNo;
  if (instance.unladedWeight != null)
    json['unladedWeight'] = instance.unladedWeight;
  if (instance.ladedWeight != null) json['ladedWeight'] = instance.ladedWeight;
  if (instance.totalWeight != null) json['totalWeight'] = instance.totalWeight;
  if (instance.containerRfid != null)
    json['containerRfid'] = instance.containerRfid;
  if (instance.trailerPlateNumbers != null)
    json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  if (instance.driverName != null) json['driverName'] = instance.driverName;
  if (instance.driverPhone != null) json['driverPhone'] = instance.driverPhone;
  if (instance.driverRegisterNo != null)
    json['driverRegisterNo'] = instance.driverRegisterNo;
  if (instance.classC != null) json['classC'] = instance.classC;
  if (instance.unladadArea != null) json['unladadArea'] = instance.unladadArea;
  if (instance.isClearance != null) json['isClearance'] = instance.isClearance;
  if (instance.ladedArea != null) json['ladedArea'] = instance.ladedArea;
  if (instance.containerNumbers != null)
    json['containerNumbers'] = instance.containerNumbers;
  if (instance.sealNumbers != null) json['sealNumbers'] = instance.sealNumbers;
  if (instance.truckScales != null) json['truckScales'] = instance.truckScales;
  if (instance.receiptStatus != null)
    json['receiptStatus'] = instance.receiptStatus;
  if (instance.receiptStatusDate != null)
    json['receiptStatusDate'] = instance.receiptStatusDate;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;

  return json;
}
