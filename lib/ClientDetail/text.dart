import 'package:flutter/material.dart';
import './infopack.dart';

class MyText extends StatelessWidget {
  String info;
  String infotitle;
  MyText(this.infotitle, this.info);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      child: InfoPack(this.infotitle, this.info),
    );
  }
}
