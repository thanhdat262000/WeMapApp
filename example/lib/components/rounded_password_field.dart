import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wemapgl_example/components/text_field_container.dart';
import 'package:wemapgl_example/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValidatorFunction<String> validatorFunc;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validatorFunc,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  var isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: isVisible,
        onChanged: widget.onChanged,
        validator: widget.validatorFunc,
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
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
