//测试数据用 模拟后端数据
import 'package:flutter_app/http/core/hi_net_adapter.dart';
import 'package:flutter_app/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": 'success'}, statusCode: 200);
    });
    // return Future<HiNetResponse>.delayed(Duration(milliseconds: 1000),(){
    //   return HiNetResponse(
    //     data: {"code": 0, "message": 'success'},
    //     statusCode: 200);
    // })
  }
}
