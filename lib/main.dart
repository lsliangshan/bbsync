import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:bbsync/tabs/index.dart';

import 'package:bbsync/config/application.dart';
import 'package:bbsync/config/routes.dart';
// import 'package:bbsync/pages/detail.dart';
// import 'package:bbsync/widget/Routes.dart';
// import 'package:fluro/fluro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '手机相册同步助手',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Index(),
      onGenerateRoute: Application.router.generator,
    );
    // routes: {'/detail': (context) => Detail()});
  }
}
