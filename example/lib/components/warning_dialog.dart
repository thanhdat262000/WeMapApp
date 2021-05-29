import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String dialogTitle, dialogContent;
  final Function press;
  const WarningDialog({
    Key key,
    this.dialogTitle,
    this.dialogContent,
    this.press,
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
            child: Text("No")),
        FlatButton(onPressed: press, child: Text("Yes"))
      ],
    );
  }
}
