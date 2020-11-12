import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

Widget appBar() {
  return AppBar(
    title: Text("PIVOTECH"),
  );
}

Widget bottomNavigationBar() {
  return BFastUI.component().consumer<NavigationState>((context, navState) =>
      BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
               BottomNavigationBarItem(
                icon: Icon(Icons.insights), title: Text('Issues')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings')),
          ],
          currentIndex: navState.selectedIndex,
          selectedItemColor: Config.primaryColor,
          onTap: navState.changeSelectedIndex));
}
