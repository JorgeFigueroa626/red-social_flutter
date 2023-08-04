// ignore_for_file: sized_box_for_whitespace

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'package:red_social/view/page/home_page/blog_response_ob.dart';

class PostWidget extends StatelessWidget {
  //////CONECTARCE A UNA API
  // BlogOb ob;
  //String categoryName,
  // PostWidget(this.ob,{this.categoryName});

  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 8,
        lightSource: LightSource.topLeft,
        //color: Colors.grey,
      ),
      child: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //////CONECTARCE A UNA API
            //                 child: Container(
            //                   width:double.infinity,
            //                    height:20,
            //                    child: CachedNetworkImage(
            //                      imageUrl: IMG_BASE_URL + ob.image,
            //                      progressIndicatorBuilder: (context, url, downloadProgress)=>
            //                         Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            //                        errorWidget:(context,url,error)=> Icon(Icons.error),
            //                    ),
            //                 ),
            const Center(
              child: FlutterLogo(
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    //ob.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Text(
                        "11/10/2023",
                        //ob.createdAt,split('T')[0]
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 7.0),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Category",
                          //categoryName!=null?ob.category.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Helo, Hi everyone",
                    //ob.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
