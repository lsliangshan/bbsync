import 'package:flutter/material.dart';
import 'package:bbsync/pages/detail.dart';
import 'package:fluro/fluro.dart';

var detailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Detail();
});
