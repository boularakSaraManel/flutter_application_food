 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Network {
  
  final String _url = 'http://192.168.1.36:8000/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  /*_getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance(); //removed comment for those 2 lines
    token = jsonDecode(newMethod(localStorage).getString('token'))['token'];
  }*/

  SharedPreferences newMethod(SharedPreferences localStorage) => localStorage;

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  postFormData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: data, headers: _setFormHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    //await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => { 
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
    };
  _setFormHeaders() => {
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
    };








}