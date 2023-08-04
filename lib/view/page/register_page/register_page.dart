// ignore_for_file: sized_box_for_whitespace, import_of_legacy_library_into_null_safe, unnecessary_null_comparison, prefer_final_fields

import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_social/helpers/response_ob.dart';
import 'package:red_social/utils/app_utils.dart';
import 'package:red_social/view/page/home_page/home_page.dart';
import 'package:red_social/view/page/register_page/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _file;
  File? sampleImage;
  String? description;
  final ImagePicker picker = ImagePicker();
  var nameText = TextEditingController();
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  //////CONECTARCE A UNA API
  final _bloc = RegisterBloc();

  @override
  void initState() {
    super.initState();
    _bloc.registerStream().listen((ResponseOb resp) {
      if (resp.message == MsgState.data) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ));
      }
      if (resp.message == MsgState.error) {
        AppUtils.showSnackBar("Sommething Wrong", _scaffoldKey.currentState);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar: NeumorphicAppBar(
        title: const Center(
            child: Text(
          "Register",
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            NeumorphicButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => bottomSheet(),
                );
              },
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 8,
                lightSource: LightSource.topLeft,
                //color: Colors.grey,
              ),
              child: Container(
                width: 100,
                height: 100,
                child: _file != null
                    ? Image.file(_file!)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person),
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
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -5,
                lightSource: LightSource.topLeft,
                //color: Colors.grey,
              ),
              child: TextField(
                controller: nameText,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
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
              stream: _bloc.registerStream(),
              widget: NeumorphicButton(
                onPressed: () {
                  //////CONECTARCE A UNA API
                  //chetctRegister();
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
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            */
            NeumorphicButton(
              onPressed: () {
                //////CONECTARCE A UNA API
                //chetctRegister();
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
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void imagenSelect(ImageSource source) async {
    var tempImage = await ImagePicker().getImage(source: source);
    setState(() {
      if (tempImage != null) {
        _file = File(tempImage.path);
      }
    });
  }

  Widget bottomSheet() {
    return Container(
      color: Colors.grey.shade100,
      height: 100.0,
      //width: MediaQuery.of(context).size.width,
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
              ],
            )
          ],
        ),
      ),
    );
  }

  //////CONECTARCE A UNA API
  chetctRegister() async {
    if (nameText.text.isEmpty ||
        emailText.text.isEmpty ||
        passwordText.text.isEmpty) {
      //if(_scaffoldKey ==null || _scaffoldKey.currentState == null)
      AppUtils.showSnackBar("Fill Data", _scaffoldKey.currentState);
      return;
    }

    if (_file == null) {
      AppUtils.showSnackBar("Select Imagen", _scaffoldKey.currentState);
      return;
    }
    Map<String, dynamic> map = {
      'name': nameText.text,
      'email': emailText.text,
      'password': passwordText.text,
    };
    _bloc.register(map, _file!);
  }

  @override
  void dispose() {
    _bloc.disponse();
    super.dispose();
  }
}
