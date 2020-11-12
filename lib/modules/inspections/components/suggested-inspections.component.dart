import 'package:flutter/material.dart';

Widget suggestedInspections() {
  return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suggested Inspections",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              inspectionItem(
                  car: "T445 DTP - Mercedes 200",
                  reportType: "Driver Inspection Report",
                  lastSubmitted: "1 day ago"),
              inspectionItem(
                  car: "T557 UPT - Toyota Prius",
                  reportType: "Driver Inspection Report",
                  lastSubmitted: "1 day ago")
            ],
          ),
        ],
      ));
}

Widget inspectionItem({String car, String reportType, String lastSubmitted}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: FlatButton(
      onPressed: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    reportType,
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  FlatButton(
                      color: Colors.grey,
                      onPressed: () {},
                      child: Text(
                        "START",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              Text("Last Submitted was " + lastSubmitted)
            ],
          ),
        ),
      ),
    ),
  );
}


