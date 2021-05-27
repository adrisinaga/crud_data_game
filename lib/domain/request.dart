import 'package:http/http.dart' as http;

///jika melalui real device
// const urlBase = 'http://192.168.10.103/datagame/';

///jika melalui emulator
const urlBase = 'http://10.0.2.2/datagame/';

// ///jika melalui genymotion
// const urlBase = 'http://10.0.3.2/datagame/';

class Request{
  final String url;
  final dynamic body;

  Request({this.url,this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(urlBase+url), body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get(){
    print(urlBase+url);
    return http.get(Uri.parse(urlBase+url)).timeout(Duration(minutes: 2));
  }
}