enum HttpMethod { GET, POST, DELETE }

//抽象类
abstract class BaseRequest {
  var pathParams;
  var useHttps = true;
  String authority() {
    return 'api.devio.org';
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    print('uri:${(uri.toString())}');
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = Map();
  //添加参数
  BaseRequest add(String k, Object val) {
    params[k] = val.toString();
    return this;
  }

  Map<String, dynamic> header = {
    'course-flag': 'fa',
    'auth-token': '课程首页获取的authtoken',
    'boarding-pass': "登录成功返回的boarding-pass"
  };

  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
