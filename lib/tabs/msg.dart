import 'package:flutter/material.dart';

class TabMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Text('消息'),
      ),
    );
  }
}
