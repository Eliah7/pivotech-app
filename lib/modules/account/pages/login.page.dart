import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pivotech/modules/account/components/login.components.dart';
import 'package:pivotech/shared/config.dart';

class LoginPage extends BFastUIPage {
  @override
  Widget build(args) {
    return BFastUI.component().custom(
      (context) => Scaffold(
      backgroundColor: Config.primaryColor,
        body: Column(children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 290, 0, 20),
        decoration: BoxDecoration(
          color: Config.primaryColor),
        child: Center(
          child: Text(
            "PIVOTECH",
            style: TextStyle(color: Colors.white, fontSize: 45),
          ),
        ),
      ),
      loginButton(context)

    ])));
  }
}
