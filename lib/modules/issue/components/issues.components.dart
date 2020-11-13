import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/inspections/components/suggested-inspections.component.dart';
import 'package:pivotech/modules/issue/models/issue.model.dart';
import 'package:pivotech/modules/issue/models/vehicle.model.dart';
import 'package:pivotech/modules/issue/state/issue.state.dart';
import 'package:pivotech/shared/config.dart';
import 'package:flutter/material.dart';

Widget addIssueButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.1,
    height: 40,
    child: RaisedButton(
      // elevation: 8,
      color: Config.primaryColor,
      onPressed: () {
        BFastUI.navigateTo("/issue/createIssue");
      },
      child: Center(
        child: Text(
          "ADD ISSUE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget watchedIssues() {
  return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Watched Issues",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              issueItem(
                  issue: Issue(
                      issueName: "Broken Window",
                      car: "T456 DTP",
                      status: IssueStatus.ACTIVE,
                      dateIssued: "FRI, 12/08/2020",
                      description: "Right Side window was hit by a stone")),
              issueItem(
                  issue: Issue(
                      issueName: "Flat Tire",
                      car: "T557 ADT",
                      status: IssueStatus.CANCELLED,
                      dateIssued: "SAT, 30/09/2020",
                      description: "Left rear tire is bust")),
              issueItem(
                  issue: Issue(
                      issueName: "Rock hit windsheild",
                      car: "T334 ADY",
                      status: IssueStatus.DONE,
                      dateIssued: "MON, 01/02/2020",
                      description:
                          "Child on the street threw a stone to the window of the car and destroyed the windsheild")),
              issueItem(
                  issue: Issue(
                      issueName: "Oil Leak",
                      car: "T557 ADT",
                      status: IssueStatus.PROCESSED,
                      dateIssued: "TUE, 07/01/2020",
                      description: "There is an oil leak")),
            ],
          ),
        ],
      ));
}

Widget issueItem({Issue issue}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: FlatButton(
      onPressed: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                issue.dateIssued != null ? issue.dateIssued : "",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  statusCircle(issue.status),
                  Text(
                    issue.issueName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                issue.car != null ? issue.car : "",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                issue.description != null ? issue.description : "",
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget statusCircle(IssueStatus status) {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: status == IssueStatus.ACTIVE
            ? Colors.yellow
            : status == IssueStatus.DONE
                ? Colors.blue
                : status == IssueStatus.PROCESSED ? Colors.green : Colors.red,
      ));
}

Widget createIssueForm(BuildContext context) {
  return BFastUI.component().consumer<IssueState>(
    (context, issueState) => Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
      child: Form(
        child: ListView(children: [
          formItem(iconData: Icons.directions_car, title: "Choose Car"),
          formItem(iconData: Icons.title_rounded, title: "Title"),
          formItem(iconData: Icons.date_range, title: "Reported On"),
          formItem(iconData: Icons.description, title: "Description"),
          formItem(iconData: Icons.camera_alt, title: "Photos"),
          submitIssueButton(context)
        ]),
      ),
    ),
  );
}

Widget formItem({IconData iconData, String title}) {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ListTile(
          leading: Icon(
            iconData,
            size: 40,
            color: Config.primaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: TextFormField()));
}

Widget submitIssueButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    width: MediaQuery.of(context).size.width / 1.1,
    height: 40,
    child: RaisedButton(
      color: Config.primaryColor,
      onPressed: () {
        // BFastUI.navigateTo("/issue/createIssue");
      },
      child: Center(
        child: Text(
          "SUBMIT",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
