import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myhost_app/pages/configs/api.dart';
import 'package:http_parser/http_parser.dart';


class ServiceNetwork {
  final dio = Dio();

  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        // var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('username = ' + username);
        String password = jsonString["password"];
        print('password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      throw "Network failed";
    }
  }

  Future<Map<String, dynamic>> getStudentData(int parentId) async {
    try {
      var url = API.BASE_URL + '/api/guardianship/account/$parentId';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var data = response.data['guardianship_data'];
        return {
          'name': data['name'],
          'surname': data['surname'],
          'account_number': data['account_number'],
        };
      } else {
        throw 'Failed to load student data';
      }
    } catch (e) {
      throw 'Failed to load student data';
    }
  }


  



 
} //end
