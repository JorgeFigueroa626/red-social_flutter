// ignore_for_file: sized_box_for_whitespace

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/view/page/category_page/category_bloc.dart';
import 'package:red_social/view/page/home_page/category_response_ob.dart';
import 'package:red_social/view/widget/post_widget.dart';

class CategoryPage extends StatefulWidget {
  //////CONECTARCE A UNA API
  // CategoryOb ob;
  // CategoryPage(this.ob,{super.key});

  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //////CONECTARCE A UNA API
  //final _bloc = CategoryBloc();
  //var _refreshController = RefreshController();
  //List<BlogOb> list =[];

  // @override
  // void initState() {
  //   super.initState();
  //   _bloc.getBlog(widget.ob.id.toString());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: NeumorphicAppBar(
        title: const Center(child: Text("Laravel")),

        //////CONECTARCE A UNA API
        //title:  Center(child: Text(widget.ob.name!)),
      ),
      //////CONECTARCE A UNA API
      /*
      body: StreamBuilder<ResponseOb>(
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
                    _bloc.getBlog(widget.ob.id.toString());
                  },
                  onLoading: () {
                    _bloc.getLoadMoreBlog(widget.ob.id.toString())M
                  },
                  controller: _refreshController,
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    //recargar la Aplicacion
                    // shrinnkWrap=true,
                    // physics:ClampingSrollPhysics();
                    children: list.map((ob) {
                      return const PostWidget(ob,categoryName:widget.ob.name);
                    }).toList(),
                    ),
                  );
                }
              },
            ),*/
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
        ],
      ),
    );
  }
}
