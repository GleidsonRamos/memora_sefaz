import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sefaz_exemplo/enum/type_request.dart';

class MyHttpClient{

  String url;
  Map<dynamic, dynamic> header;
  Map<dynamic, dynamic> body;
  var onSucess;
  var onFail;
  TypeRequest type;

  MyHttpClient({
    this.onFail,
    this.onSucess,
    this.body,
    this.type,
    this.header,
    this.url
  });

  executar(){

    header['Content-type'] = 'application/json';

    switch(type){
      case TypeRequest.POST:
        post();
        break;
      case TypeRequest.GET:
        get();
        break;
      default:
        break;
    }

  }

  post() async{
    var _body = convert.json.encode(body);
    var response = await http.post(url, headers: header, body: _body);
    if (response.statusCode != 200 &&  response.statusCode != 201 ) {
      onFail(response);
    } else {
      final responseJson = convert.jsonDecode(response.body);
      onSucess(responseJson, response.headers);
    }
  }

  get() async{
    var response = await http.get(url, headers: header);
    if (response.statusCode != 200 &&  response.statusCode != 201 ) {
      onFail(response);
    } else {
      final responseJson = convert.jsonDecode(response.body);
      onSucess(responseJson, response.headers);
    }
  }

}