import 'dart:convert';
import 'package:http/http.dart'as http;

class ApiResponse{
  final baseUrl="http://127.0.0.1:8000/api/";
  _buildHeader(){
    return { 'Accept' : 'application/json', 'cache-control' : 'no-cache'};
  }
  postFunction(body,url) async {
    final response = await http.post(Uri.parse(baseUrl+url), headers: _buildHeader(), body: json.encode(body));
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      if(url=="login"){
        //storeAuth(resData);
      }
      return resData;
    } else {
      return 'failed';
    }
  }
  getFunction(url) async {
    final response = await http.get(Uri.parse(baseUrl+url), headers: _buildHeader(),);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
  putFunction(body,url) async {
    final response = await http.put(Uri.parse(baseUrl+url), headers: _buildHeader(),body: json.encode(body));
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
  deleteFunction(url) async {
    final response = await http.delete(Uri.parse(baseUrl+url), headers: _buildHeader());
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
}