import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();
  login(name, password) async {
    try {
      return await dio.post('http://192.168.1.244:3000/authenticate',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
          
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addUser(name, password) async {
    return await dio.post('http://192.168.1.244:3000/adduser',
        data: {"name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getinfo(token) async {
    dio.options.headers['Authorizations'] = 'Bearer $token';
    return await dio.get('http://192.168.1.244:3000/getinfo');
  }

    update(about, email ,image) async {
    return await dio.post('http://192.168.1.244:3000/updateOne',
        data: {"about": about , "email": email ,"userImage": image },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
