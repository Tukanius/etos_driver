part '../parts/customer.dart';

class Customer {
  String? id;
  String? type;
  String? name;
  String? createdAt;
  String? updatedAt;

  Customer({
    this.id,
    this.type,
    this.name,
    this.createdAt,
    this.updatedAt,
  });
  static $fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
