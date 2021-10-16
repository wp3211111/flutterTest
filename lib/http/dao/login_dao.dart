import 'package:flutter_app/http/core/hi_net.dart';
import 'package:flutter_app/http/request/base_request.dart';
import 'package:flutter_app/http/request/login_request.dart';
import 'package:flutter_app/http/request/registration_request.dart';

class LoginDao {
  static login(String userName, String password) {
    return _send(userName, password);
  }

  static Registration(
      String userName, String password, String imoocId, String orderId) {
    return _send(userName, password, imoocId: imoocId, orderId: orderId);
  }

  static _send(String userName, String password, {imoocId, orderId}) async {
    BaseRequest request;
    if (imoocId != null && orderId != null) {
      request = RegitstrationRquest();
    } else {
      request = LoginRequest();
    }
    request
        .add("userName", userName)
        .add("password", password)
        .add("imoocId", imoocId)
        .add("orderId", orderId);
    var result = await HiNet.getInstance()?.fire(request);
    print(result);
    return result;
  }
}
