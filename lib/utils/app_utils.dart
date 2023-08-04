import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/helpers/response_ob.dart';

class AppUtils {
  static void showSnackBar(String title, ScaffoldMessengerState? state,
      {Color bgColor = Colors.red, Color textColor = Colors.white}) {
    state!.showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: bgColor,
      ),
    );
  }

  ///CONECTAR A LA API

  static Widget lodingWidget({Stream? stream, Widget? widget}) {
    return StreamBuilder<ResponseOb>(
      initialData: ResponseOb(),
      ///ERROR SOLUCIONAR
      //stream: stream,
      builder: (context, snapshot) {
        ResponseOb resp = snapshot.data!;
        if (resp.message == MsgState.loading) {
          return Center(
              child: Neumorphic(
            style: const NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.circle(),
              depth: -3,
            ),
            child: const CircularProgressIndicator(),
          ));
        } else {
          return widget!;
        }
      },
    );
  }
}
