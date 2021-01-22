import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:bbsync/config/application.dart';
// import 'package:bbsync/widget/custom_route.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/detail');
            // Navigator.push(context, CustomRoute7(child: Detail()));
            /**
             * nativeModal,
                inFromLeft,
                inFromTop,
                inFromRight,
                inFromBottom,
                fadeIn,
                custom,
                material,
                materialFullScreenDialog,
                cupertino,
                cupertinoFullScreenDialog,
             */
            Application.router.navigateTo(
              context,
              '/detail',
              transition: TransitionType.cupertino,
              transitionDuration: const Duration(seconds: 4),
            );
          },
          child: Text(
            'screen1',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
