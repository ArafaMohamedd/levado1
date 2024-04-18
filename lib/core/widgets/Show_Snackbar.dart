 import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String masagName) {
  ScaffoldMessenger.of
    (context).showSnackBar(
    SnackBar(content:  Text(masagName  ,)
    ),);
}