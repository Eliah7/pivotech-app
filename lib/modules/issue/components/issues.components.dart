import 'package:bfast/bfast.dart';
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
  return BFastUI.component()
      .consumer<IssueState>((context, issueState) => Container(
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
              FutureBuilder(
                  future: issueState.fetchIssues(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                          children:
                              issueState.presentIssues(data: snapshot.data));
                    } else {
                      return Center(
                          child: Container(
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        width: 100,
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      ));
                    }
                  }),
            ],
          )));
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
        key: issueState.formKey,
        child: ListView(children: [
          formItem(
              iconData: Icons.directions_car,
              title: "Choose Car",
              textController: issueState.textFieldControllers["car_selection"]),
          formItem(
              iconData: Icons.title_rounded,
              title: "Title",
              textController: issueState.textFieldControllers["title"]),
          dateFormItem(
              iconData: Icons.date_range,
              title: "Reported On",
              textController: issueState.textFieldControllers["reported_on"]),
          formItem(
              iconData: Icons.description,
              title: "Description",
              textController: issueState.textFieldControllers["description"]),
          choosePhotoItem(
            iconData: Icons.camera_alt,
            title: "Photos",
          ),
          submitIssueButton(context),
          loadingIndicator()
        ]),
      ),
    ),
  );
}

Widget dateFormItem(
    {IconData iconData, String title, TextEditingController textController}) {
  return BFastUI.component().custom((context) => Padding(
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
            subtitle: FlatButton(
              child: Text("Choose Date"),
              onPressed: () {
                final pickedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light(),
                      child: child,
                    );
                  },
                );

                if(pickedDate != null){
                  BFastUI.getState<IssueState>().pickedDate = pickedDate.toString();
                  print(BFastUI.getState<IssueState>().pickedDate);
                }
              },
            )
            // InputDatePickerFormField(
            //   firstDate: DateTime(DateTime.now().year),
            //   lastDate: DateTime.now(),

            // )
            ),
      ));
}

Widget choosePhotoItem({IconData iconData, String title}) {
  return BFastUI.component()
      .consumer<IssueState>((context, issueState) => Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Column(children: [
            ListTile(
                leading: Icon(
                  iconData,
                  size: 40,
                  color: Config.primaryColor,
                ),
                title: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: FlatButton(
                  child: Text("Take Photo"),
                  onPressed: () {
                    issueState.choosePhoto();
                  },
                )),
            Container(
              child: issueState.imageLocation != null ? Text("Image Uploaded") : Text("No Image Selected"),
            )
          ])));
}

Widget formItem(
    {IconData iconData, String title, TextEditingController textController}) {
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
          subtitle: TextFormField(
            controller: textController,
          )));
}

Widget submitIssueButton(BuildContext context) {
  return BFastUI.component()
      .consumer<IssueState>((context, issueState) => Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: MediaQuery.of(context).size.width / 1.1,
            height: 40,
            child: RaisedButton(
              color: Config.primaryColor,
              onPressed: () {
                issueState.createIssue(context);
                // BFastUI.navigator().maybePop();
              },
              child: Center(
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ));
}

Widget loadingIndicator() {
  return BFastUI.component().consumer<IssueState>((context, issueState) =>
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          width: MediaQuery.of(context).size.width / 1.1,
          height: 5,
          child: issueState.loading
              ? LinearProgressIndicator(backgroundColor: Colors.green)
              : null));
}
