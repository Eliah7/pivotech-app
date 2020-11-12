import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

Widget appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text("PIVOTECH", style: TextStyle(color: Config.primaryColor, fontSize: 35, fontWeight: FontWeight.bold),),
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
