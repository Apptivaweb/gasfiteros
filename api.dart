import 'dart:convert';
import 'package:http/http.dart' as http;

class Servicio{

  final String _url = "https://gasfitero.app/api/";

  postData(data, apiUrl) async {
    var _fullUrl = Uri.parse(_url+apiUrl);
    return await http.post(
        _fullUrl,
        body: jsonEncode(data),
        headers: {
          'Content-type' : 'application/json',
          'Accept':'application/json'
        }
    );
  }

  getData(apiUrl) async {
    var _fullUrl = Uri.parse(_url+apiUrl);
    //SharedPreferences _sesion = await SharedPreferences.getInstance();
    return await http.get(
        _fullUrl,
        headers: {
          'Content-type' : 'application/json',
          'Accept':'application/json'
        });
  }

/*
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('access_token');
    return 'Bearer $token';
  }
*/

}