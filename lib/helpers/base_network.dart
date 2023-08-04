// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';

// ignore: constant_identifier_names
enum RequestType { Get, Post }

class BaseNetwork {
  void getReq(String url,
      {Map<String, String>? params,
      Function? onDataCallBack,
      Function? errorCallBack}) async {
    requestData(RequestType.Get,
        url: url,
        params: params,
        onDataCallBack: onDataCallBack,
        errorCallBack: errorCallBack);
  }

  void postReq(String url,
      {Map<String, String>? params,
      FormData? fd,
      Function? onDataCallBack,
      Function? errorCallBack}) async {
    requestData(RequestType.Post,
        url: url,
        params: params,
        onDataCallBack: onDataCallBack,
        errorCallBack: errorCallBack);
  }

  void requestData(RequestType rt,
      {@required String? url,
      Map<String, String>? params,
      FormData? fd,
      Function? onDataCallBack,
      Function? errorCallBack}) async {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10000;
    options.receiveTimeout = 10000;

    String token = await SharedPref.getData(key: SharedPref.token);
    options.headers = {'Autorization': token};

    Dio dio = Dio(options);
    try {
      Response response;
      if (rt == RequestType.Get) {
        if (params == null) {
          response = await dio.get(url);
        } else {
          response = await dio.get(url, queryParameters: params);
        }
      } else {
        if (params != null || fd != null) {
          response = await dio.post(url, data: fd ?? params);
        } else {
          response = await dio.get(url);
        }
      }

      int statusCode = response.statusCode;
      ResponseOb respOb = ResponseOb();

      ///BUSCAMOS LA CONEXION A LA API PARA  EL POST
      print("**************\n");
      print(url);
      print(statusCode);
      print(response.data);
      print("***************\n");

      
      if (statusCode == 200) {
        //data
        if (response.data['success'] == true) {
          respOb.data = response.data;
          respOb.message = MsgState.data;
          onDataCallBack!(respOb);
        } else {
          respOb.data = response.data['result'];
          respOb.message = MsgState.error;
          respOb.errState = ErrState.userErr;
          onDataCallBack!(respOb);
        }
      } else {
        //erro
        respOb.errState = ErrState.serverError;
        respOb.message = MsgState.error;
        onDataCallBack!(respOb);
      }
    } catch (e) {
      ResponseOb respOb = ResponseOb();
      respOb.errState = ErrState.serverError;
      respOb.message = MsgState.error;
      onDataCallBack!(respOb);
    }
  }
}
