import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? _image;
  Future OpenCamera() async{
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future<void> _options() async
  {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.cyan,
        shape: StadiumBorder(),
        title: Text('Choose an option'),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[
            GestureDetector(
                    child: const Text('Take a picture'),
                    onTap: OpenCamera,
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: const Text('Choose from gallery'),
                    onTap: OpenGallery,
                  ),
          ],),
        ),
      );
    });
  }

  Future OpenGallery() async
  {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera app'),
      ),
      body: Center(
        child: _image==null ? const Text('No Image'):Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _options,
        child: const Icon(Icons.add_a_photo),
        tooltip: 'Open Camera/gallery',
      ),
    );
  }
}