import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:pivotech/modules/account/states/login.state.dart';
import 'package:pivotech/shared/config.dart';

Widget loginButton(BuildContext context) {
  return Container(
    margin:
        EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 3, 0, 0),
    width: MediaQuery.of(context).size.width / 1.4,
    height: 40,
    child: RaisedButton(
      // elevation: 8,
      color: Colors.grey,
      onPressed: () {
        BFastUI.navigateTo("/account/loginForm");
      },
      child: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  );
}

Widget submitLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
    width: MediaQuery.of(context).size.width / 1.5,
    height: 40,
    child: RaisedButton(
      // elevation: 8,
      color: Config.primaryColor,
      onPressed: () {
        BFastUI.navigateTo("/issue/");
      },
      child: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  );
}

Widget loginForm() {
  return BFastUI.component().consumer<LoginState>((context, loginState) =>
      Container(
          margin: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height / 5, 0, 0),
          padding: EdgeInsets.all(15),
          child: Form(
              child: Center(
                  child: ListView(
            children: [
              Center(
                child:
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text("PIVOTECH",
                  style: TextStyle(color: Config.primaryColor, fontSize: 45,)))),
              loginFormItem(
                  iconData: Icons.person,
                  title: "Username",
                  textController: loginState.textFieldControllers["username"]),
              loginFormItem(
                  iconData: Icons.lock,
                  title: "Password",
                  textController: loginState.textFieldControllers["username"]),
              submitLogin(context)
            ],
          )))));
}

Widget loginFormItem(
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
