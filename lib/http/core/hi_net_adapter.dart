import 'dart:convert';

import 'package:flutter_app/http/request/base_request.dart';

//网络请求抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

class HiNetResponse<T> {
  var data;
  var request;
  var extra;
  var statusMessage;
  var statusCode;
  HiNetResponse(
      {this.data,
      this.statusCode,
      this.statusMessage,
      this.extra,
      this.request});
  // T data;
  // BaseRequest request;
  // int statusCode;
  // String statusMessage;
  // dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
