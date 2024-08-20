part '../parts/process_truck_exit.dart';

class ProcessTruckExit {
  String? status;
  String? date;

  ProcessTruckExit({
    this.status,
    this.date,
  });
  factory ProcessTruckExit.fromJson(Map<String, dynamic> json) =>
      _$ProcessTruckExitFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessTruckExitToJson(this);
}
