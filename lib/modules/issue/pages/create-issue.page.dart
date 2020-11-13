import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/shared/components/shared.component.dart';

class CreateIssuePage extends BFastUIPage {
  @override
  Widget build(args) {
    return Scaffold(
      appBar: appBar(title: "Create Issue"),
      body: Container(
        child: Center(
          child: Text("Create Issue"),
        ),
      ),
    );
  }
}
