// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/view/page/home_page/home_page.dart';
import 'package:red_social/view/page/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      await SharedPref.getData(key: SharedPref.token).then((token) {
        print(token);
        if (token.toString() != "null" && token != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
