import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:bbsync/config/route_handlers.dart';

class Routes {
  static String detail = '/detail';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return;
    });
    router.define(detail,
        handler: detailHandler, transitionType: TransitionType.fadeIn);
  }
}
