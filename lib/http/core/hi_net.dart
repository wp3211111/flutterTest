import 'package:flutter_app/http/core/dio_adapter.dart';
import 'package:flutter_app/http/core/hi_error.dart';
import 'package:flutter_app/http/core/hi_net_adapter.dart';
import 'package:flutter_app/http/request/base_request.dart';

class HiNet {
  HiNet._();
  static HiNet? _instance;
  static HiNet? getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async {
    HiNetResponse response;
    var error;
    var result;
    var status;
    try {
      response = await send(request);
      result = response.data;
      printLog('result:${result}');
      status = response.statusCode;
      switch (status) {
        case 200:
          return result;
          break;
        case 401:
          throw NeedLogin();
          break;
        case 403:
          throw NeedAuth(result.toString(), data: result);
          break;
        default:
          throw HiNetError(status, result.toString(), data: result);
      }
      return result;
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      error = e;
      printLog(e);
    }

    // if (response == null) {
    //   printLog(error);
    // }
  }

  Future<dynamic> send(BaseRequest request) async {
    printLog('url:${request.url().toString()}');
    //HiNetAdapter adapter = MockAdapter();
    HiNetAdapter adapter = DioAdaper();
    return adapter.send(request);
    // return Future.value({
    //   "statusCode": 200,
    //   "data": {"code": 0, "message": 'success'}
    // });
  }

  void printLog(log) {
    print('hi_net:${log.toString()}');
  }
}
