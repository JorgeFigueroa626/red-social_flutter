// ignore_for_file: avoid_print, unnecessary_null_comparison, prefer_final_fields

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/utils/app_utils.dart';
import 'package:red_social/view/page/home_page/home_page.dart';
import 'package:red_social/view/page/login_page/login_bloc.dart';
import 'package:red_social/view/page/register_page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailText = TextEditingController(text: 'luis@gmail.com');
  var passwordText = TextEditingController(text: '123456');
  var _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _bloc = LoginBloc();

  //////CONECTARCE A UNA API

  @override
  void initState() {
    super.initState();
    _bloc.loginStream().listen((ResponseOb resp) {
      if (resp.message == MsgState.data) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ));
      }
      if (resp.message == MsgState.error) {
        if (resp.errState == ErrState.userErr) {
          AppUtils.showSnackBar(
              resp.data.toString(), _scaffoldKey.currentState);
        } else {
          AppUtils.showSnackBar("Sommething Wrong", _scaffoldKey.currentState);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100.0),
            const FlutterLogo(size: 100),
            const SizedBox(height: 20.0),
            Neumorphic(
              padding: const EdgeInsets.all(5.0),
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -5,
                lightSource: LightSource.topLeft,
                //color: Colors.grey,
              ),
              child: TextField(
                controller: emailText,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Neumorphic(
              padding: const EdgeInsets.all(5.0),
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(12),
                ),
                depth: -5,
                lightSource: LightSource.topLeft,
                //color: Colors.grey,
              ),
              child: TextField(
                controller: passwordText,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 30.0),

            //////CONECTARCE A UNA API
            /*
            AppUtils.lodingWidget(
                stream: _bloc.loginStream(),
                widget: NeumorphicButton(
                  onPressed: () {
                    //////CONECTARCE A UNA API
                    //checkLogin();
                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                )),
            */
            NeumorphicButton(
              onPressed: () {
                //////CONECTARCE A UNA API
                //checkLogin();

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ));
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(12),
                ),
                depth: 8,
                //lightSource: LightSource.topLeft,
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            NeumorphicButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const RegisterPage();
                  },
                ));
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(12),
                ),
                depth: 8,
                //lightSource: LightSource.topLeft,
              ),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  

  checkLogin() {
    if (emailText.text.isEmpty || passwordText.text.isEmpty) {
      //if(_scaffoldKey ==null || _scaffoldKey.currentState == null)
      AppUtils.showSnackBar("Fill Data", _scaffoldKey.currentState);
      return;
    }
    Map<String, String> map = {
      'email': emailText.text,
      'password': passwordText.text,
    };
    _bloc.login(map);
  }

  @override
  void dispose() {
    _bloc.disponse();
    super.dispose();
  }
}
