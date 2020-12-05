import 'package:bfast/bfast.dart';
import 'package:bfast/bfast_config.dart';
import 'package:bfastui/bfastui.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pivotech/app/app.module.dart';
import 'package:pivotech/main.config.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);


void main() {
  configureDependencies();
  _connectWithBFastCloudProject();
  runApp(
    BFastUI.module(PivotechApp()).start(
      initialPath: '/account',
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
  BFast.init(AppCredentials('pivotech', 'pivotech'));
}
