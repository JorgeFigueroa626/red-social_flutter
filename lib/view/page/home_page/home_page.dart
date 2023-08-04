// ignore_for_file: sized_box_for_whitespace

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/view/page/category_page/category_page.dart';
//import 'package:red_social/view/page/home_page/blog_response_ob.dart';
//import 'package:red_social/view/page/home_page/category_response_ob.dart';
import 'package:red_social/view/page/home_page/home_bloc.dart';
import 'package:red_social/view/page/profile_page/profile_page.dart';
import 'package:red_social/view/page/upload_post_page/upload_post_page.dart';
//import 'package:red_social/view/widget/category_widget.dart';
import 'package:red_social/view/widget/post_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //////CONECTARCE A UNA API
  //var _refreshController = RefreshController();
  final _bloc = HomeBloc();
  // @override
  // void initState() {
  //   super.initState();
  //   _bloc.getCayegory();
  //    _bloc.getBlog();
  //    _blog.blogStream().listen((ResponseOb resp)){
  //      if(resp.message==MsgState.data){
  //          if(resp.pageLoad==PageLoad.first){
  //            _refreshController.refreshCompleted();
  //           }
  //          if(resp.pageLoad==PageLoad.nextPage){
  //            _refreshController.loadCompleted();
  //           }
  //          if(resp.pageLoad==PageLoad.noMore){
  //            _refreshController.loadNoData();
  //           }
  //      }
  //    });
  // }

  //List<BlogOb> list =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Center(child: Text("Red Social")),
        leading: NeumorphicButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const ProfilePage();
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
          child: const Icon(Icons.person),
        ),
        actions: [
          NeumorphicButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const UploadPostPage();
                },
              ));
              //CONECTAR A LA API
              //)).then((value) {
              //  if (value!=null) {
              //   if (value) {
              //     _bloc.getBlog();
              //   }
              //  }
              // });
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12),
              ),
              depth: 8,
              //lightSource: LightSource.topLeft,
            ),
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            height: 70,
            //////CONECTARCE A UNA API
            ///REFRESCAR LA APLICACION
            ///body:Column(
            //////children: [
            ///////Container(
            ////////height: 70,
            /*
            Expanded(
            child: StreamBuilder<ResponseOb>(
              stream: _bloc.categoryStream(),
              initialData: ResponseOb(message: MsgState.loading),
              builder: (context, snapshot) {
                ResponseOb resp = snapshot.data!;
                if (resp.message == MsgState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (resp.message == MsgState.error) {
                  return const Center(
                    child: Text("Something Wrong!!"),
                  );
                } else {
                  List<CategoryOb> list = resp.data;
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    scrollDirection: Axis.horizontal,
                    children: list.map((ob) {
                      return CategoryWidget(ob);
                    }).toList(),
                  );
                }
              },
            ),
            ),
            */
            /////

            child: ListView(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              scrollDirection: Axis.horizontal,
              children: [
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const CategoryPage();
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
                  child: const Center(child: Text("Flutter")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("Angular")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("React")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("Laravel")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text(".NET")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("Blazor")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("Android")),
                ),
                NeumorphicButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                    depth: 8,
                    //lightSource: LightSource.topLeft,
                  ),
                  child: const Center(child: Text("Laravel")),
                ),
              ],
            ),
          ),
          //////CONECTARCE A UNA API
          /*
          Expanded(
          child: StreamBuilder<ResponseOb>(
            stream: _bloc.blogStream(),
            initialData: ResponseOb(message: MsgState.loading),
            builder: (context, snapshot) {
              ResponseOb resp = snapshot.data!;
              if (resp.message == MsgState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (resp.message == MsgState.error) {
                return const Center(
                  child: Text("Something Wrong!!"),
                );
              } else {
                if(resp.pageLoad==PageLoad.first){
                  list = resp.data;
                }else{
                  list.addAll(resp.data);
                }
                return SmartRefresher(
                  enablePullUp:list.length>4,
                  onRefresh: () {
                    _bloc.getBlog();
                  },
                  onLoading: () => _refreshController,
                  controller: _refreshController,
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    //recargar la Aplicacion
                    // shrinnkWrap=true,
                    // physics:ClampingSrollPhysics();
                    children: list.map((ob) {
                      return const PostWidget(ob);
                    }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
          */
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.disponse();
    super.dispose();
  }
}
