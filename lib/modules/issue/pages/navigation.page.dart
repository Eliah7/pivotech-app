import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/components/issues.components.dart';
import 'package:pivotech/modules/issue/components/navigation.components.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';
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
        floatingActionButton: (navState.selectedTab == NavTabs.HOME) || (navState.selectedTab == NavTabs.ISSUES) ?  addIssueButton(context) : null,
      ),
    );
  }
}

enum NavTabs{
  HOME, SETTINGS, ISSUES
}


