// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print, prefer_interpolation_to_compose_strings

import 'package:red_social/helpers/base_network.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_constants.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseNetwork {
  PublishSubject<ResponseOb> loginController = PublishSubject();
  Stream<ResponseOb> loginStream() => loginController.stream;

  login(Map<String, String> map) {
    ResponseOb resp = ResponseOb(message: MsgState.loading);
    loginController.sink.add(resp);
    postReq(LOGIN_URL, params: map, onDataCallBack: (ResponseOb resp) {
      print(resp.data);
      SharedPref.setData(
          key: SharedPref.token, value: "Bearer" + resp.data['token']);
      loginController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      loginController.sink.add(resp);
    });
  }

  disponse() {
    loginController.close();
  }
}
