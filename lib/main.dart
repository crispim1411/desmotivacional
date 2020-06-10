import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Mensagens desmotivacionais',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.blue[800],
          ),
          body: Center(child: ImageSelected()),
          backgroundColor: Colors.black,
          bottomSheet: Text('By Rodrigo Crispim', style: TextStyle(fontSize: 16, color: Colors.purple[700], backgroundColor: Colors.black)),
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
  final Random random = Random();
  int selector = 0;

  AssetImage _nextImage() {
    selector = random.nextInt(images.length);
    return AssetImage('images/' + images[selector]);
  }

  Widget build(BuildContext context) {
    var selectedImage = _nextImage();

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
