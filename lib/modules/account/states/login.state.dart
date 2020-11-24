import 'package:bfastui/adapters/state.dart';
import 'package:flutter/material.dart';

class LoginState extends BFastUIState{
  final textFieldControllers = {
    "username": TextEditingController(),
    "password": TextEditingController(),
  };
  
}