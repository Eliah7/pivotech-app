import 'package:bfastui/adapters/state.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/issue/models/vehicle.model.dart';

class IssueState extends BFastUIState {
  static var vehicles = [
    VehicleModel(name: "Mitsubish", plateNo: "T556 DTY"),
    VehicleModel(name: "Benz", plateNo: "T536 ADR"),
    VehicleModel(name: "IST", plateNo: "T557 DTP")
  ];

  List<DropdownMenuItem<dynamic>> get vehicleNames => getVehicleNames();

  List<DropdownMenuItem<dynamic>> getVehicleNames() {
    var _vehicleNames = [];
    vehicles.forEach((element) {
      _vehicleNames.add(DropdownMenuItem(child: Text(element.name)));
    });
    return _vehicleNames;
  }
  var selectedCarDropDownMenu = DropdownMenuItem(child: Text(vehicles[0].name));


}
