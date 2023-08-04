// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe, unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/helpers/shared_pref.dart';
import 'package:red_social/utils/app_utils.dart';
import 'package:red_social/view/page/home_page/category_response_ob.dart';
import 'package:red_social/view/page/upload_post_page/upload_post_bloc.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  File? _file;
  File? sampleImage;
  // PickedFile? _imagenFile;
  // final ImagePicker _picker = ImagePicker();
  var selectdCategoryId;

  //CONECTANDO A LA API
  List<CategoryOb>? list = [];
  var titleText = TextEditingController();
  var descripText = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _bloc = UploadPostBloc();

  @override
  void initState() {
    super.initState();
    loadCategory();
    _bloc.uploadStream().listen((ResponseOb resp) {
      if (resp.message == MsgState.data) {
        Navigator.of(context).pop(true);
      }
      if (resp.message == MsgState.error) {
        AppUtils.showSnackBar(resp.data, _scaffoldKey.currentState);
      }
    });
  }

  loadCategory() {
    SharedPref.getData(key: SharedPref.category).then((value) {
      if (value != null && value.toString() != "null") {
        setState(() {
          list = CategoryResponseOb.fromJson(json.decode(value)).result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar: NeumorphicAppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 60.0),
          child: const Text("New Post"),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SizedBox(height: 5.0),
          NeumorphicButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => bottomSheet(),
              );
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              lightSource: LightSource.topLeft,
              //color: Colors.grey,
            ),
            child: Container(
              height: 200,
              child: _file != null
                  ? Image.file(_file!)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.photo),
                        SizedBox(height: 15.0),
                        Text(
                          "Upload\nPhoto",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20.0),
          Neumorphic(
            padding: const EdgeInsets.all(5.0),
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -5,
              lightSource: LightSource.topLeft,
              //color: Colors.grey,
            ),
            child: const TextField(
              //CONECTAR A LA API
              //controller: titleText,
              decoration: InputDecoration(
                hintText: "Enter Title",
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
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -5,
              lightSource: LightSource.topLeft,
              //color: Colors.grey,
            ),
            child: const TextField(
              //CONECTAR A LA API
              //controller: descripText,
              decoration: InputDecoration(
                hintText: "Enter Description",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              ),
              minLines: 4,
              maxLines: 4,
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
            child: DropdownButtonFormField<int>(
              onChanged: (value) {
                //CONECTAR A LA API
                //selectdCategoryId = value;
              },
              //CONECTAR A LA API
              // items: list!.map((ob) {
              //   return DropdownMenuItem(
              //     value: ob.id,
              //     child: Text(ob.name!),
              //   );
              // }).toList(),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Laravel"),
                )
              ],
              decoration: const InputDecoration(
                hintText: "Select Category",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          /////CONECTAR A LA API
          /*
          AppUtils.lodingWidget(
            stream: _bloc.uploadStream(),
            widget: NeumorphicButton(
              onPressed: () {
                //CONECTAR A LA API
                //uploadData;
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
                  "Upload",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          */
          NeumorphicButton(
            onPressed: () {
              //CONECTAR A LA API
              //uploadData;
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
                "Upload",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  uploadData() {
    if (titleText.text.isEmpty || descripText.text.isEmpty) {
      AppUtils.showSnackBar("Fill Requiered Fields", _scaffoldKey.currentState);
      return;
    }
    if (selectdCategoryId == null) {
      AppUtils.showSnackBar("Select category", _scaffoldKey.currentState);
      return;
    }
    if (_file == null) {
      AppUtils.showSnackBar("Select image", _scaffoldKey.currentState);
      return;
    }
    Map<String, dynamic> map = {
      'title': titleText,
      'description': descripText,
      'category_id': selectdCategoryId,
    };
    _bloc.uploadPost(map, _file!);
  }

  @override
  void dispose() {
    _bloc.disponse();
    super.dispose();
  }

  void imagenSelect(ImageSource source) async {
    var tempImage =
        await ImagePicker().getImage(source: source, imageQuality: 10);
    setState(() {
      if (tempImage != null) {
        _file = File(tempImage.path);
      }
    });
    // final pickedFile = await _picker.getImage(
    //   source: source,
    // );
    // setState(() {
    //   _imagenFile = pickedFile;
    // });
  }

  Widget bottomSheet() {
    return Container(
      color: Colors.grey.shade100,
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Material(
        child: Column(
          children: <Widget>[
            const Text(
              "Selecciona una Imagen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NeumorphicButton(
                  onPressed: () {
                    imagenSelect(ImageSource.camera);
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera_sharp),
                      SizedBox(width: 5.0),
                      Text(
                        "CAMARA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                NeumorphicButton(
                  onPressed: () {
                    imagenSelect(ImageSource.gallery);
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.photo),
                      SizedBox(width: 5.0),
                      Text(
                        "GALERIA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     imagenSelect(ImageSource.gallery);
                //   },
                //   icon: const Icon(Icons.image_outlined),
                //   label: const Text("GALERIA"),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
