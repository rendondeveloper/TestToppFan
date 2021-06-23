import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetCustom {
  final double _sizeButtonFlag = 16.0;
  final double _sizeRadius = 20.0;

  void showButtonSheetCustom(
      {Key key,
      @required final BuildContext context,
      final Text title,
      final Text message,
      final String textOk,
      final String textCancel,
      final bool isDismissible,
      final TextStyle textStyleButtonFlag,
      final Widget child,
      final VoidCallback callbackOk,
      final VoidCallback callbackCancel}) async {
    showModalBottomSheet(
        context: context,
        isDismissible: isDismissible ?? true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(this._sizeRadius),
              topRight: Radius.circular(this._sizeRadius)),
        ),
        builder: (BuildContext buildContext) {
          return Wrap(children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
              child: Center(child: title ?? Container()),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Center(child: message),
            ),
            Container(
              child: Center(child: child),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 5.0, bottom: Platform.isAndroid ? 5.0 : 22.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: new Text(textOk ?? "Salir",
                          style: textStyleButtonFlag ?? TextStyle(
                                  fontSize: this._sizeButtonFlag,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black)),
                      onPressed: callbackOk == null
                          ? () {
                              Navigator.of(context).pop();
                            }
                          : () {
                              callbackOk();
                              Navigator.of(context).pop();
                            },
                    ),
                  ]),
            )
          ]);
        });
  }
}
