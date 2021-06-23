import 'dart:io';
import 'package:test_toppfan/commonresources/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderProvider {
  Widget showOrHideLoader(
      {@required bool show,
        String message

      }) {
    return Visibility(
      visible: show,
      child: Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Platform.isAndroid
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor))
                      : CupertinoActivityIndicator()),
              SizedBox(height: 20.0),
              Text(
                message ?? "",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
