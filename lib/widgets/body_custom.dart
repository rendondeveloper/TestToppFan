import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyCustom {
  Widget setBody({String backgroundAssetRoute, Widget body, loader, message}) {
    return Stack(
      children: [
        backgroundAssetRoute != null
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(backgroundAssetRoute),
                        fit: BoxFit.cover)))
            : Container(),
        body,
        loader ?? Container(),
      ],
    );
  }
}
