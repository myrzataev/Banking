import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailedScreen extends StatelessWidget {
  final String appBarTitle;
  final String information;
  const DetailedScreen(
      {super.key, required this.appBarTitle, required this.information});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Center(
        child: Container(
            child: PhotoView(
          imageProvider: AssetImage(information),
        )),
      ),
    );
  }
}
