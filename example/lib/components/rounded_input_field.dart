import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wemapgl_example/constants.dart';
import 'package:wemapgl_example/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValidatorFunction<String> validatorFunc;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validatorFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      onChanged: onChanged,
      validator: validatorFunc,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(29)),
          focusedBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(29)),
          errorBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(29)),
          focusedErrorBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(29)),
          fillColor: kPrimaryLightColor,
          filled: true,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
