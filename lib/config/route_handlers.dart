import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:bbsync/pages/detail.dart';

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Detail();
});
