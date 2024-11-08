import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/App.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/Sign-in_Screen.dart';

class NetworkCaller{
  static Future<NetworkResponse>getRequest(String url)async{
    try{
      Uri uri = Uri.parse(url);
      Map<String,String>headers = {
        'token' : AuthController.accessToken.toString()
      };
      printRequest(url, null, headers);
      final Response response = await get(uri,headers: headers);
      printResponse(url,response);
      if(response.statusCode == 200){
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeData
        );
      }
      else if(response.statusCode == 401){
        _moveToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "UnAuthenticated!",
        );
      }
      else{
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
        );
      }
    }
    catch(e){
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString()
      );
    }
  }
  static Future<NetworkResponse>postRequest(
      {required String url, Map<String, dynamic>? body})async{
    try{
      Uri uri = Uri.parse(url);
      Map<String,String>headers = {
        'Content-Type': 'application/json',
        'token' : AuthController.accessToken.toString()
      };
      printRequest(url, body, headers);
      final Response response = await post(
          uri,
          body: jsonEncode(body),
          headers: headers
      );

      printResponse(url,response);
      if(response.statusCode == 200){
        final decodeData = jsonDecode(response.body);
        if(decodeData['status'] == 'fail'){
          return NetworkResponse(
              isSuccess: false,
              statusCode: response.statusCode,
              errorMessage: decodeData['data']
          );
        }
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeData
        );
      }
      else if(response.statusCode == 401){
        _moveToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "UnAuthenticated!",
        );
      }
      else{
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    }
    catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString()
      );
    }
  }
  static void printRequest(String url, Map<String,dynamic>?body ,Map<String,dynamic>?headers){
    debugPrint('REQUEST:\nURL:${url}\nBody: ${body}\HEADERS:${headers}');
  }
  static void printResponse(String url, Response response){
    debugPrint('URL:${url}\nStatusCODE: ${response.statusCode}\nData:${response.body}');
  }
  static void _moveToLogin()async{
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.navigatorkey.currentContext!,
        MaterialPageRoute(builder:(context) => SignInScreen(),),
            (p) => false
    );
  }
}