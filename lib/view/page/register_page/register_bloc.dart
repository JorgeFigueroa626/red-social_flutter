// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, import_of_legacy_library_into_null_safe, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:red_social/helpers/base_network.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart';

class RegisterBloc extends BaseNetwork {
  PublishSubject<ResponseOb> registerController = PublishSubject();
  Stream<ResponseOb> registerStream() => registerController.stream;

  register(Map<String, dynamic> map, File _file) async {
    ResponseOb resp = ResponseOb(message: MsgState.loading);
    registerController.sink.add(resp);
    map.addAll({
      'image': await MultipartFile.fromFile(_file.path,
          filename: basename(_file.path))
    });
    FormData fd = FormData.fromMap(map);
    postReq(REGISTER_URL, fd: fd, onDataCallBack: (ResponseOb resp) {
      print(resp.message);
      SharedPref.setData(
          key: SharedPref.token, value: "Bearer" + resp.data['token']);
      registerController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      registerController.sink.add(resp);
    });
  }

  disponse() {
    registerController.close();
  }
}
