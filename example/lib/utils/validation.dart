import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator([
  EmailValidator(errorText: "Enter valid email"),
  RequiredValidator(errorText: "* Required")
]);
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: '* Required'),
  MinLengthValidator(6, errorText: "Password should be at least 6 characters")
]);
