import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final Text titleToolbar;
  final VoidCallback callback;
  final Color colorBackground, colorIconBackOrHamburger;
  final bool allowBack, allowMenu, circleBack;
  final double elevation;
  final List<Widget> actions;

  AppBarCustom({
    Key key,
    this.allowBack,
    this.titleToolbar,
    this.allowMenu,
    this.colorIconBackOrHamburger,
    this.colorBackground,
    this.elevation,
    this.circleBack,
    this.callback,
    this.actions,
  });

  @override
  State<StatefulWidget> createState() {
    return _AppBarCustom();
  }

  @override
  Size get preferredSize => Size(0.0, 50.0);
}

class _AppBarCustom extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: this.widget.colorIconBackOrHamburger ?? Colors.white),
      elevation: this.widget.elevation ?? 4.0,
      automaticallyImplyLeading: this.widget.allowMenu ?? false,
      centerTitle: true,
      title: this.widget.titleToolbar ?? Text(""),
      backgroundColor: this.widget.colorBackground ??
          AppBarTheme.of(context).color ??
          Theme.of(context).primaryColor,
      leading: this.drawBackOrMenu(
        allowBack: this.widget.allowBack ?? false,
        allowMenu: this.widget.allowMenu ?? false,
        circleBack: this.widget.circleBack ?? false,
      ),
      actions: this.widget.actions,
    );
  }

  Widget drawBackOrMenu({bool allowBack, bool allowMenu, bool circleBack}) {
    if (allowMenu && !allowBack) {
      return null;
    } else if (allowBack) {
      return IconButton(
          icon: circleBack
              ? Container(
                  height: 30.0,
                  width: 30.0,
                  padding: EdgeInsets.only(left: 6.0),
                  child: Center(
                    child: this.iconBack(),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.black),
                )
              : this.iconBack(),
          onPressed: this.widget.callback != null
              ? this.widget.callback
              : () {
                  Navigator.pop(context);
                });
    }else{
      return null;
    }
  }

  Widget iconBack() {
    return Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        //size: 30.0,
        color: this.widget.colorIconBackOrHamburger);
  }
}
