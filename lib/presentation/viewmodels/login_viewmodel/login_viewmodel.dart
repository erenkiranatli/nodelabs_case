import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/manager/validation_manager.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscurePassword = true;

  void toggleObscurePassword() {
    isObscurePassword = !isObscurePassword;
    notifyListeners();
  }

  void validateInputs() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    ValidationManager validationManager = ValidationManager();
    validationManager.validateEmail(email);
    validationManager.validatePassword(password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
