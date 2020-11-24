import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pivotech/modules/account/components/login.components.dart';
import 'package:pivotech/shared/config.dart';

class LoginFormPage extends BFastUIPage {
  @override
  Widget build(args) {
    return BFastUI.component().custom(
      (context) => Scaffold(
        body: loginForm()
        )
        );
  }
}
