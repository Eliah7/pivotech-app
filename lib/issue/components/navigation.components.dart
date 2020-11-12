import 'package:bfastui/bfastui.dart';
import 'package:pivotech/issue/pages/home.page.dart';
import 'package:pivotech/issue/pages/navigation.page.dart';
import 'package:pivotech/issue/pages/settings.page.dart';
import 'package:pivotech/issue/state/navigation.state.dart';
import 'package:flutter/material.dart';

Widget getSelectedTabPage() {
  return BFastUI.component().consumer<NavigationState>((context, navState) {
    switch (navState.selectedTab) {
      case NavTabs.HOME:
        return HomePage();
        break;
      case NavTabs.SETTINGS:
        return SettingsPage();
        break;
      default:
        return Center(child: Text(navState.selectedTab.toString()));
    }
  });
}
