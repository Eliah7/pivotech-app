import 'package:flutter/material.dart';
import 'package:pivotech/modules/issue/components/issues.components.dart';

class IssuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [watchedIssues()]);
  }
}
