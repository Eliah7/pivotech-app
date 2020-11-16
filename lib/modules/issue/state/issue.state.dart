import 'package:bfastui/adapters/state.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/issue/issue.module.dart';
import 'package:pivotech/modules/issue/models/issue.model.dart';
import 'package:pivotech/modules/issue/models/vehicle.model.dart';
import 'package:pivotech/modules/issue/services/http.service.dart';

class IssueState extends BFastUIState {
  static var vehicles = [
    VehicleModel(name: "Mitsubish", plateNo: "T556 DTY"),
    VehicleModel(name: "Benz", plateNo: "T536 ADR"),
    VehicleModel(name: "IST", plateNo: "T557 DTP")
  ];
  final textFieldControllers = {
    "car_selection" : TextEditingController(),
    "title" : TextEditingController(),
    "reported_on" : TextEditingController(),
    "description" : TextEditingController(),
    "photos": TextEditingController()
  };
  final formKey = GlobalKey<FormState>();
  final httpService = HttpService();

  Future createIssue() async{
    if (formKey.currentState.validate()) {
      var issue = Issue(
        car: textFieldControllers["car_selection"].text,
        dateIssued: textFieldControllers["reported_on"].text,
        description: textFieldControllers["description"].text,
        issueName: textFieldControllers["title"].text,
        status: IssueStatus.ACTIVE
      );
      
      await httpService.createIssue(issue);
      

      print(issue);
    }
  }


}
