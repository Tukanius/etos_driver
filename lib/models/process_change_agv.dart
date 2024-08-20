// import 'package:etos_driver/models/customer.dart';

import 'package:etos_driver/models/tos_agv.dart';

part '../parts/process_change_agv.dart';

class ProcessChangeAgv {
  String? status;
  String? date;
  TosAgvTruck? tosAgvTruck;
  TosAgvTruck? tosAgvTruck2;

  ProcessChangeAgv({
    this.status,
    this.date,
    this.tosAgvTruck,
    this.tosAgvTruck2,
  });
  static $fromJson(Map<String, dynamic> json) =>
      _$ProcessChangeAgvFromJson(json);

  factory ProcessChangeAgv.fromJson(Map<String, dynamic> json) =>
      _$ProcessChangeAgvFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessChangeAgvToJson(this);
}
