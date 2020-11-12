import 'package:bfast/bfast.dart';
import 'package:bfast/bfast_config.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/app/app.module.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

void main() {
  _connectWithBFastCloudProject();
  runApp(
    BFastUI.module(PivotechApp()).start(
      initialPath: '/issue',
      title: "Pivotech",
      theme: ThemeData(
        fontFamily: Config.fontFamily,
        primarySwatch: Config.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}

void _connectWithBFastCloudProject() {
  // BFast.init(AppCredentials('moneychange', 'moneychange'));
}
