import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/pages/home.page.dart';
import 'package:pivotech/modules/issue/pages/issues.page.dart';
import 'package:pivotech/modules/issue/pages/navigation.page.dart';
import 'package:pivotech/modules/issue/pages/settings.page.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';
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
      case NavTabs.ISSUES:
        return IssuesPage();
        break;
      default:
        return Center(child: Text(navState.selectedTab.toString()));
    }
  });
}
