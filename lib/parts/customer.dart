part of '../models/customer.dart';

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['_id'] != null ? json['_id'] as String : null,
    type: json['type'] != null ? json['type'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['id'] = instance.id;
  if (instance.type != null) json['type'] = instance.type;
  if (instance.name != null) json['name'] = instance.name;
  if (instance.createdAt != null) {
    json['createdAt'] = instance.createdAt;
  }
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  return json;
}
