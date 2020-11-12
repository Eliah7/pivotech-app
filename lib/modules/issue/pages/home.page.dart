import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pivotech/modules/inspections/components/suggested-inspections.component.dart';
import 'package:pivotech/modules/issue/components/issues.components.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [  
              suggestedInspections(),
              watchedIssues(),
              
            ],
          ),
          //  Spacer(),
           
        ],
      ),
    );
  }
}
