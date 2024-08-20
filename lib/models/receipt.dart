part '../parts/receipt.dart';

class Receipt {
  String? id;
  String? customer;
  String? regCustomer;
  String? contractNo;
  String? receiptNo;
  String? receiptDate;
  String? supplierName;
  String? supplier;
  String? buyerName;
  String? productName;
  String? transportName;
  String? vehicleRfidNumber;
  String? vehiclePlateNo;
  int? unladedWeight;
  int? ladedWeight;
  int? totalWeight;
  List<String>? containerRfid;
  List<String>? trailerPlateNumbers;
  String? driverName;
  String? driverPhone;
  String? driverRegisterNo;
  String? classC;
  String? unladadArea;
  bool? isClearance;
  String? ladedArea;
  List<String>? containerNumbers;
  List<String>? sealNumbers;
  List<String>? truckScales;
  String? receiptStatus;
  String? receiptStatusDate;
  String? createdAt;
  String? updatedAt;

  Receipt({
    this.id,
    this.customer,
    this.regCustomer,
    this.contractNo,
    this.receiptNo,
    this.receiptDate,
    this.supplierName,
    this.supplier,
    this.buyerName,
    this.productName,
    this.transportName,
    this.vehicleRfidNumber,
    this.vehiclePlateNo,
    this.unladedWeight,
    this.ladedWeight,
    this.totalWeight,
    this.containerRfid,
    this.trailerPlateNumbers,
    this.driverName,
    this.driverPhone,
    this.driverRegisterNo,
    this.classC,
    this.unladadArea,
    this.isClearance,
    this.ladedArea,
    this.containerNumbers,
    this.sealNumbers,
    this.truckScales,
    this.receiptStatus,
    this.receiptStatusDate,
    this.createdAt,
    this.updatedAt,
  });
  static $fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
