import 'package:etos_driver/models/user.dart';
import 'package:etos_driver/utils/http_request.dart';

final httpRequest = HttpRequest("https://mine.etos.mn/aut/app");
final httpRequestSet = HttpRequest("http://set.etos.mn/aut/app");
final httpRequestBatnaa = HttpRequest("http://192.168.1.49:30601/app");
// final httpRequestSet = HttpRequest("http://192.168.1.96:30606/api");

class AuthApi {
  login(User user) async {
    var res = await httpRequest.post('/auth/login',
        data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  register(User user) async {
    var res = await httpRequest.post("/auth/register",
        data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  getOtp(String email) async {
    var res = await httpRequest.get('/otp?otpMethod=REGISTER&email=$email',
        handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  otpVerify(User data) async {
    Map<String, dynamic> json = {};
    json['otpCode'] = data.otpCode;
    json['otpMethod'] = data.otpMethod;
    var res = await httpRequest.post('/otp/verify', data: json, handler: true);
    return res;
  }

  me(bool handler) async {
    var res = await httpRequest.get('/auth/me', handler: handler);
    return User.fromJson(res as Map<String, dynamic>);
  }

  logout() async {
    var res = await httpRequest.post('/auth/logout');
    return res;
  }
}
