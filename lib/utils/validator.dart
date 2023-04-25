import 'package:email_validator/email_validator.dart';

class Validator {
  static String validate(String? inputValue, InputType type) {
    String errorMessage = "";
    switch (type) {
      case (InputType.email):
        if (!EmailValidator.validate(inputValue!)) {
          errorMessage = "Email invalid";
        }
        return errorMessage;
      default:
        return errorMessage;
    }
  }
}

enum InputType { email, password }
