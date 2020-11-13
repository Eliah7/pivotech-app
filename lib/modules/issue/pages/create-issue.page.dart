import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/issue/components/issues.components.dart';
import 'package:pivotech/shared/components/shared.component.dart';

class CreateIssuePage extends BFastUIPage {
  @override
  Widget build(args) {
    return BFastUI.component().custom(
      (context) => Scaffold(
          appBar: appBar(title: "Report Issue"),
          body: createIssueForm(context)),
    );
  }
}
