import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void navigateTo(BuildContext context, Widget destination) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => destination
    ),
  );
}
void navigateAndDismissAllBehind(BuildContext context, Widget destination) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => destination,
      ),
          (route) => false);
}

//MARK:- Default Text Button
Widget defaultTextButton({
  required String textTitle,
  required void Function()? function
}) => TextButton(
  onPressed: function,
  child: Text(textTitle.toUpperCase()),
);