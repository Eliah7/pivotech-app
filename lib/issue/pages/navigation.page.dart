import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/issue/components/navigation.components.dart';
import 'package:pivotech/issue/state/navigation.state.dart';
import 'package:pivotech/shared/components/shared.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabsNavigationPage extends BFastUIPage {
  @override
  Widget build(args) {
    return BFastUI.component().consumer<NavigationState>(
      (context, navState) => Scaffold(
        appBar: appBar(),
        body: getSelectedTabPage(),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }
}

enum NavTabs{
  HOME, SETTINGS, HISTORY 
}


