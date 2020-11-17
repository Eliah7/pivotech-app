import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/issue/components/issues.components.dart';
import 'package:pivotech/modules/issue/issue.module.dart';
import 'package:pivotech/modules/issue/models/issue.model.dart';
import 'package:pivotech/modules/issue/models/vehicle.model.dart';
import 'package:pivotech/modules/issue/services/http.service.dart';
import 'package:pivotech/shared/components/shared.component.dart';

class IssueState extends BFastUIState {
  final textFieldControllers = {
    "car_selection": TextEditingController(),
    "title": TextEditingController(),
    "reported_on": TextEditingController(),
    "description": TextEditingController(),
    "photos": TextEditingController()
  };
  final formKey = GlobalKey<FormState>();
  final httpService = HttpService();
  var loading = false;

  Future<List<dynamic>> fetchIssues() async {
    try {
      return await httpService.getIssues();
    } catch (e) {
      print(e);
      return [];
    }
  }

  List<Widget> presentIssues({List<dynamic> data}) {
    List<Widget> widgets = [];
    if (data != null) {
      data.forEach((element) {
        widgets.add(issueItem(
            issue: Issue(
                issueName:
                    element["issueName"] != null ? element["issueName"] : "",
                car: element["car"] != null ? element["car"] : "",
                status: IssueStatus.ACTIVE,
                dateIssued:
                    element["dateIssued"] != null ? element["dateIssued"] : "",
                description: element["description"] != null
                    ? element["description"]
                    : "")));
      });
    } else {
      print("data is null");
    }

    return widgets;
  }

  Future createIssue(BuildContext context) async {
    setLoadingStatus(true);

    if (formKey.currentState.validate()) {
      await httpService.createIssue(generateIssueFromForm()).then((value) {
        showSnackBar(context: context, text: 'Issue is created');
        setLoadingStatus(false);
        BFastUI.navigator().maybePop();
      }).catchError((err) {
        setLoadingStatus(false);
        showSnackBar(context: context, text: 'There is a network error!');
        print(err);
      });
    } else {
      setLoadingStatus(false);
    }
  }

  Issue generateIssueFromForm() {
    return Issue(
        car: textFieldControllers["car_selection"].text,
        dateIssued: textFieldControllers["reported_on"].text,
        description: textFieldControllers["description"].text,
        issueName: textFieldControllers["title"].text,
        status: IssueStatus.ACTIVE);
  }

  void setLoadingStatus(bool status) {
    this.loading = status;
    notifyListeners();
  }
}
