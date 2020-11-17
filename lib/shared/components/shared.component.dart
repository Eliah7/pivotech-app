import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

Widget appBar({String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    leading: title == null ? null : ButtonBar(
      children: [
        IconButton(icon: Icon(Icons.arrow_back, color: Config.primaryColor, size: 35, ), padding: EdgeInsets.fromLTRB(10, 0, 0, 2), onPressed: (){
          BFastUI.navigator().maybePop();
        })
      ],
    ),
    title: Text(title != null ? title : "PIVOTECH", style: TextStyle(color: Config.primaryColor, fontSize: 35, fontWeight: FontWeight.bold),),
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

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({String text, BuildContext context}){
   return Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(text),
    ));
}