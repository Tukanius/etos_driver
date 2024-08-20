part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] != null ? json['_id'] as String : null,
    accessToken:
        json['accessToken'] != null ? json['accessToken'] as String : null,
    firstname: json['firstname'] != null ? json['firstname'] as String : null,
    lastname: json['lastname'] != null ? json['lastname'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
    registerNo:
        json['registerNo'] != null ? json['registerNo'] as String : null,
    password: json['password'] != null ? json['password'] as String : null,
    otpMethod: json['otpMethod'] != null ? json['otpMethod'] as String : null,
    otpCode: json['otpCode'] != null ? json['otpCode'] as String : null,
    sessionScope:
        json['sessionScope'] != null ? json['sessionScope'] as String : null,
    sessionState:
        json['sessionState'] != null ? json['sessionState'] as String : null,
    tokenType: json['tokenType'] != null ? json['tokenType'] as String : null,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['id'] = instance.id;
  if (instance.otpCode != null) json['otpCode'] = instance.otpCode;
  if (instance.otpMethod != null) json['otpMethod'] = instance.otpMethod;
  if (instance.registerNo != null) json['registerNo'] = instance.registerNo;
  if (instance.tokenType != null) json['tokenType'] = instance.tokenType;
  if (instance.accessToken != null) json['accessToken'] = instance.accessToken;
  if (instance.sessionState != null) {
    json['sessionState'] = instance.sessionState;
  }
  if (instance.email != null) json['email'] = instance.email;
  if (instance.phone != null) json['phone'] = instance.phone;
  if (instance.lastname != null) json['lastname'] = instance.lastname;
  if (instance.firstname != null) json['firstname'] = instance.firstname;
  if (instance.password != null) json['password'] = instance.password;
  if (instance.sessionScope != null) {
    json['sessionScope'] = instance.sessionScope;
  }

  return json;
}

// Map<String, dynamic> _$UserToJson(User instance) {
//   Map<String, dynamic> json = {};

//   json['firstname'] = instance.firstname;
//   json['lastname'] = instance.lastname;
//   json['email'] = instance.email;
//   json['phone'] = instance.phone;
//   json['registerNo'] = instance.registerNo;
//   json['password'] = instance.password;

//   return json;
// }

// String _$UserFromAuthJson(Map<String, dynamic> json) {
//   return json['accessToken'];
// }

// Map<String, dynamic> _$UserToAuthJson(instance) {
//   Map<String, dynamic> json = {
//     "email": instance["username"],
//     "password": instance["password"],
//     "firstname": instance["firstname"],
//     "lastname": instance["lastname"],
//     "phone": instance["phone"],
//     "registerNo": instance["registerNo"],
//     "otpCod": instance["otpCod"],
//     "otpMethod": instance["otpMethod"],
//     "sessionScope": instance["sessionScope"],
//     "sessionState": instance["sessionState"],
//     "tokenType": instance["tokenType"],
//   };

//   return json;
// }
