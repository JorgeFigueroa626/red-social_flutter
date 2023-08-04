// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, import_of_legacy_library_into_null_safe, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:red_social/helpers/base_network.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_constants.dart';
import 'package:red_social/view/page/profile_page/profile_ob.dart';
import 'package:red_social/view/page/profile_page/profile_response_post_ob.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BaseNetwork {
  PublishSubject<ResponseOb> profileController = PublishSubject();
  Stream<ResponseOb> profileStream() => profileController.stream;

  PublishSubject<ResponseOb> blogController = PublishSubject();
  Stream<ResponseOb> blogStream() => blogController.stream;

  getProfile() async {
    SharedPref.getData(key: SharedPref.profile).then(
      (value) {
        if (value != null && value.toString() != "null") {
          ResponseOb resp = ResponseOb(message: MsgState.data);
          resp.data = ProfileResponseOb.fromJson(json.decode(value)).result;
          profileController.sink.add(resp);
        }
      },
    );
    getReq(PROFILE_URL, onDataCallBack: (ResponseOb resp) {
      print(resp.data);
      if (resp.data['success'] == true) {
        SharedPref.setData(
            key: SharedPref.profile, value: json.decode(resp.data));
        resp.data = ProfileResponseOb.fromJson(resp.data).result;
      }
      profileController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      profileController.sink.add(resp);
    });
  }

  getPost() async {
    getReq(USER_POST_URL, onDataCallBack: (ResponseOb resp) {
      print(resp.data);
      if (resp.data['success'] == true) {
        resp.data = ProfileResponsePostOb.fromJson(resp.data).result;
      }
      blogController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      blogController.sink.add(resp);
    });
  }

  void disponse() {
    blogController.close();
    profileController.close();
  }
}
