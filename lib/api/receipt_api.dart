import 'package:etos_driver/models/process.dart';
import 'package:etos_driver/models/result.dart';
import 'package:etos_driver/utils/http_request.dart';

final httpRequest1 = HttpRequest("http://192.168.1.49:30606/app");
final httpRequest = HttpRequest("https://set.etos.mn/se1/app");

class ReceiptApi {
  getHistoryList(ResultArguments arguments) async {
    var res =
        await httpRequest.get('/info/export-item', data: arguments.toJson());
    return Result.fromJson(res, SetProcess.fromJson);
  }

  getActiveReceipt(bool handler) async {
    var res = await httpRequest.get('/info/active-process', handler: handler);
    // return SetProcess.fromJson(res as Map<String, dynamic>);
    return res;
  }
}
