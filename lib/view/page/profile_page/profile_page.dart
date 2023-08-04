// ignore_for_file: sized_box_for_whitespace

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/helpers/response_ob.dart';
//import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/view/page/home_page/blog_response_ob.dart';
import 'package:red_social/view/page/login_page/login_page.dart';
import 'package:red_social/view/page/profile_page/profile_bloc.dart';
//import 'package:red_social/view/page/profile_page/profile_ob.dart';
import 'package:red_social/view/widget/post_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //////CONECTARCE A UNA API
  final _bloc = ProfileBloc();

  // @override
  // void initState() {
  //   super.initState();
  //   _bloc.getProfile();
  //  _bloc.getPost();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
          ? Colors.blueGrey
          : Colors.grey.shade100,
      appBar: NeumorphicAppBar(
        title: const Center(
            child: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        actions: [
          Switch(
            value: NeumorphicTheme.of(context)!.isUsingDark,
            onChanged: (bool value) {
              if (NeumorphicTheme.of(context)!.isUsingDark) {
                NeumorphicTheme.of(context)!.themeMode = ThemeMode.light;
              } else {
                NeumorphicTheme.of(context)!.themeMode = ThemeMode.dark;
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            //////CONECTARCE A UNA API
            // StreamBuilder<ResponseOb>(
            //   builder: (context, snapshot) {
            //     ResponseOb resp = snapshot.data!;
            //     if (resp.message == MsgState.loading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (resp.message == MsgState.error) {
            //       return const Center(
            //         child: Text("Something Wrong, ty again!"),
            //       );
            //     } else {
            //       ProfileOb po=resp.data;
            //       return Neumorphic(
            //         padding: const EdgeInsets.all(5.0),
            //         style: NeumorphicStyle(
            //           shape: NeumorphicShape.flat,
            //           boxShape:
            //               NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            //           depth: 8,
            //           //lightSource: LightSource.topLeft,
            //           //color: Colors.grey,
            //         ),
            //         child: Container(
            //           height: 180,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //                NeumorphicButton(
            //                  style: NeumorphicStyle(
            //                  shape: NeumorphicShape.flat,
            //                  boxShape:
            //                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            //                  depth: 8,
            //                 onPressed: () {
            //                   logout();
            //                 },
            //                 child: Container(
            //                   width:60,
            //                    height:60,
            //                    child: CachedNetworkImage{
            //                      imageUrl: IMG_BASE_URL + po.image,
            //                      progressIndicatorBuilder: (context, url, downloadProgress)=>
            //                            CircularProgressIndicator(value: downloadProgress.progress),
            //                        errorWidget:(context,url,error)=> Icon(Icons.error),
            //                    },
            //                 ),
            //               )
            //               const SizedBox(height: 15.0),
            //               const Text(
            //                 po.name,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 18),
            //               ),
            //               const Text(
            //                 po.email,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 18),
            //               ),
            //               const SizedBox(height: 10.0),
            //               NeumorphicButton(
            //                 margin: const EdgeInsets.only(left: 20, right: 20),
            //                 onPressed: () {
            //                   logout();
            //                 },
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: const [
            //                     Icon(Icons.exit_to_app),
            //                     Text("Logout")
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     }
            //   },
            //   stream: _bloc.profileStream(),
            //   initialData: ResponseOb(message: MsgState.loading),
            // ),
            ///
            Neumorphic(
              padding: const EdgeInsets.all(5.0),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 8,
                lightSource: LightSource.topLeft,
                //color: Colors.grey,
              ),
              child: Container(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(
                      size: 50,
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "MG MG",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      "correo@gmail.com",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10.0),
                    NeumorphicButton(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      onPressed: () {
                        logout();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.exit_to_app),
                          Text("Logout")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Your Post",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            ///CONEXION A LA API
            /*
            const SizedBox(height: 20.0),
            StreamBuilder(
              initialData: ResponseOb(message: MsgState.loading),
              stream: _bloc.blogStream(),
              builder: (context, snapshot) {
              ResponseOb resp = snapshot.data as ResponseOb;
              if (resp.message == MsgState.data) {
                List<BlogOb> list = resp.data;
                return ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: list.map((ob) {
                    return const PostWidget();
                  }).toList(),
                );
              } else if (resp.message == MsgState.error) {
                return const Center(
                  child: Text("Somenting Wrong"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            */
            const SizedBox(height: 10.0),
            const PostWidget(),
            const PostWidget(),
            const PostWidget(),
            const PostWidget(),
            const PostWidget(),
            const PostWidget(),
          ],
        ),
      ),
    );
  }

  logout() {
    SharedPref.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const LoginPage();
      },
    ), (route) => false);
  }

  @override
  void dispose() {
    _bloc.disponse();
    super.dispose();
  }
}
