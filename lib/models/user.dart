part '../parts/user.dart';

class User {
  String? id;
  String? lastname;
  String? firstname;
  String? email;
  String? phone;
  String? password;
  String? registerNo;
  String? accessToken;
  String? otpMethod;
  String? otpCode;
  String? sessionScope;
  String? tokenType;
  String? sessionState;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.registerNo,
    this.accessToken,
    this.password,
    this.otpCode,
    this.otpMethod,
    this.sessionScope,
    this.tokenType,
    this.sessionState,
  });

  static $fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
