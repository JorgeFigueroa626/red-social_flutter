// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, import_of_legacy_library_into_null_safe, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:red_social/helpers/base_network.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_constants.dart';
import 'package:red_social/view/page/home_page/blog_response_ob.dart';
import 'package:red_social/view/page/home_page/category_response_ob.dart';
import 'package:red_social/view/page/profile_page/profile_ob.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseNetwork {
  PublishSubject<ResponseOb> categoryController = PublishSubject();
  Stream<ResponseOb> categoryStream() => categoryController.stream;

  PublishSubject<ResponseOb> blogController = PublishSubject();
  Stream<ResponseOb> blogStream() => blogController.stream;

  getCayegory() {
    SharedPref.getData(key: SharedPref.category).then(
      (value) {
        if (value != null && value.toString() != "null") {
          ResponseOb resp = ResponseOb(message: MsgState.data);
          resp.data = CategoryResponseOb.fromJson(json.decode(value)).result;
          categoryController.sink.add(resp);
        }
      },
    );
    getReq(CAT_URL, onDataCallBack: (ResponseOb resp) {
      print(resp.data);
      //if (resp.data['success'] == true) {
      SharedPref.setData(
          key: SharedPref.category, value: json.encode(resp.data));
      resp.data = CategoryResponseOb.fromJson(resp.data).result;
      //}
      categoryController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      categoryController.sink.add(resp);
    });
  }

  String? nextPageUrl;
  getBlog() {
    getReq(POST_URL, onDataCallBack: (ResponseOb resp) {
      print(resp.data);
      print("one");
      BlogResponseOb bro = BlogResponseOb.fromJson(resp.data);
      print("two");
      if (bro.result!.nextPageUrl != "null") {
        nextPageUrl = bro.result!.nextPageUrl;
      }
      print("three");

      resp.pageLoad = PageLoad.first;

      resp.data = bro.result!.data;
      blogController.sink.add(resp);
    }, errorCallBack: (ResponseOb resp) {
      blogController.sink.add(resp);
    });
  }

  getLoadMoreBlog() {
    if (nextPageUrl == null) {
      List<BlogOb> list = [];
      ResponseOb resp = ResponseOb(
          pageLoad: PageLoad.noMore, message: MsgState.data, data: list);
      blogController.sink.add(resp);
    } else {
      getReq(nextPageUrl!, onDataCallBack: (ResponseOb resp) {
        //print(resp.data);
        BlogResponseOb bro = BlogResponseOb.fromJson(resp.data);
        if (bro.result!.nextPageUrl != "null") {
          nextPageUrl = bro.result!.nextPageUrl;
          resp.pageLoad = PageLoad.nextPage;
        } else {
          nextPageUrl = null;
        }
        blogController.sink.add(resp);
        resp.data = bro.result!.data;
      }, errorCallBack: (ResponseOb resp) {
        blogController.sink.add(resp);
      });
    }
  }

  void disponse() {
    categoryController.close();
    blogController.close();
  }
}
