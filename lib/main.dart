import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Mensagens desmotivacionais',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.blue[800],
          ),
          body: Center(child: ImageSelected()),
          backgroundColor: Colors.black,
        ),
    );
  }
}

class ImageSelected extends StatefulWidget {
  _ImageSelected createState() => _ImageSelected();
}

class _ImageSelected extends State<ImageSelected> {
  final List<String> images =
      List.generate(42, (i) => 'msg' + (i + 1).toString() + '.jpg');
  int selector = 0;

  AssetImage _nextImage() {
    if (++selector >= images.length) selector = 0;
    return AssetImage('images/' + images[selector]);
  }

  Widget build(BuildContext context) {
    var selectedImage = AssetImage('images/' + images[selector]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: selectedImage,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                selectedImage = _nextImage();
                print(file.toString());
              });
            },
            label: Text(
              'Desmotive-se',
              style: TextStyle(fontSize: 28),
            ),
            backgroundColor: Colors.orange[700],
          ),
        ),
      ],
    );
  }
}
