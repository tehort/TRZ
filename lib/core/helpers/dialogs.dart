import 'package:flutter/material.dart';
import 'package:trz/core/theme/styles.dart';

Future showErrorDialog(BuildContext context, String message) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Aviso', style: kStyleAlertHeaderText()),
        content: Text(
          '$message',
          style: kStyleAlertBodyText(),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok', style: kStyleAlertButtonText()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
