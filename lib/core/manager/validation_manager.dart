import 'package:nodelabs_case/core/services/localization_service.dart';

class ValidationManager {
  void validateEmail(String email) {
    if (email.isEmpty) {
      throw (LocalizationService.current.emptyMailError);
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      throw (LocalizationService.current.invalidMailError);
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      throw (LocalizationService.current.emptyPassError);
    }
    if (password.length < 6) {
      throw (LocalizationService.current.passMinDigitError);
    }
  }

  void validateFullName(String fullName) {
    if (fullName.isEmpty) {
      throw (LocalizationService.current.emptyFullnameError);
    }
  }

  void validateRePassword(String password, String pastPassword) {
    if (password.isEmpty != pastPassword.isEmpty) {
      throw (LocalizationService.current.matchPassErorr);
    }
  }
}
