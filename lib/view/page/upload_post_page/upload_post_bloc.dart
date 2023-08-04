// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, import_of_legacy_library_into_null_safe, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:red_social/helpers/base_network.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart';

class UploadPostBloc extends BaseNetwork {
  PublishSubject<ResponseOb> uploadController = PublishSubject();
  Stream<ResponseOb> uploadStream() => uploadController.stream;

  uploadPost(Map<String, dynamic> map, File _file) async {
    ResponseOb resp = ResponseOb(message: MsgState.loading);
    uploadController.sink.add(resp);
    map.addAll({
      'image': await MultipartFile.fromFile(_file.path,
          filename: basename(_file.path))
    });
    FormData fd = FormData.fromMap(map);
    postReq(CREATE_URL, fd: fd, onDataCallBack: (ResponseOb resp) {
      print(resp.message);
      SharedPref.setData(
          key: SharedPref.token, value: "Bearer" + resp.data['token']);
      uploadController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      uploadController.sink.add(resp);
    });
  }

  disponse() {
    uploadController.close();
  }
}
