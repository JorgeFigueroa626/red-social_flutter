import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:red_social/view/page/category_page/category_page.dart';
import 'package:red_social/view/page/home_page/category_response_ob.dart';

class CategoryWidget extends StatelessWidget {
  CategoryOb ob;
  CategoryWidget(this.ob, {super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
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
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 8,
        ),
        child: Center(child: Text(ob.name!)));
  }
}
