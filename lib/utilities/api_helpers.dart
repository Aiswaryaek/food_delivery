import 'package:http/http.dart';
import 'base_urls.dart';

class Resource<T> {
  String? url;
  dynamic body;
  T Function(Response response)? parse;

  Resource({this.url,this.body, this.parse});
}



Map<String, String> getHeaders(String token) {
  return {"Authorization": 'Bearer ' + token};
}

Map<String, String> getHeadersWithApplicationJson() {
  return {"Content-Type": 'application/json'};
}

Map<String, String> getJsonHeader(String token) {
  return {"Authorization": 'Bearer ' + token,"Content-Type": 'application/json'};
}

Map<String, String> getAuthHeaders(String token) {
  return {"Authorization": 'Basic ' + token};
}

Uri getUrl(String component) {
  var url= Uri.parse(BaseUrls.devApiBaseUrl + component);
  return url;
}

Map<String, String> getJsonContent() {
  return {"Content-Type": 'application/json'};
}