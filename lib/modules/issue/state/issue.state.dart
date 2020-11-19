import 'dart:io';

import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  String imageLocation;
  Map<String, dynamic> pickedDate;

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
                imageUrl:  element["imageUrl"] != null ? element["imageUrl"] : "",
                dateIssued:
                    element["dateIssued"] != null ? element["dateIssued"] : "",
                description: element["description"] != null
                    ? element["description"]
                    : "")));
      });
      this.imageLocation = '';
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
        clearInputs();
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

  void clearInputs() {
    this.imageLocation = '';
    this.textFieldControllers.forEach((key, value) {
      value.clear();
    });
    notifyListeners();
  }

  Issue generateIssueFromForm() {
    return Issue(
        car: textFieldControllers["car_selection"].text,
        imageUrl: imageLocation != null ? imageLocation : null,
        dateIssued: this.pickedDate != null ? pickedDate: "",
        description: textFieldControllers["description"].text,
        issueName: textFieldControllers["title"].text,
        status: IssueStatus.ACTIVE);
  }

  void setLoadingStatus(bool status) {
    this.loading = status;
    notifyListeners();
  }

  choosePhoto() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      sendImageToFirebase(image);
    });
  }

  sendImageToFirebase(dynamic image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('Images/${(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      imageLocation = fileURL;
      notifyListeners();
    });
  }
}
