import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/account/components/login.components.dart';

class LoginFormPage extends BFastUIPage {
  @override
  Widget build(args) {
    return BFastUI.component().custom((context) => Scaffold(body: loginForm()));
  }
}
