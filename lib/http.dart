import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "10.0.2.2:8000";

Future<RequestResult> login(String route, [dynamic data]) async {
  var datastr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result = await http
      .post(url, body: datastr, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var datastr = jsonEncode(data);
  var result = await http
      .post(url, body: datastr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}
