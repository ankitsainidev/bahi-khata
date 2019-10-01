import 'package:flutter/material.dart';

class InfoPack extends StatelessWidget {
  String infotitle;
  String info;
  InfoPack(this.infotitle, this.info);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Text(
          this.infotitle + ': ',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          
          ),
        ),
        Text(this.info,),
      ],
    );
  }
}
