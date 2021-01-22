import 'package:flutter/material.dart';

class TabProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Text('我的'),
      ),
    );
  }
}
