import 'package:flutter/material.dart';

class AuthDialog extends StatelessWidget {
  final String dialogTitle, dialogContent;
  const AuthDialog({
    Key key,
    this.dialogTitle,
    this.dialogContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: Text(dialogContent),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Try again"))
      ],
    );
  }
}
