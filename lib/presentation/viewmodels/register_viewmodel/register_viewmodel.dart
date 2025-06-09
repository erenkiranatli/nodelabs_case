import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/manager/validation_manager.dart';

class RegisterViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureRePassword = true;

  void toggleObscurePassword() {
    isObscurePassword = !isObscurePassword;
    notifyListeners();
  }

  void toggleObscureRePassword() {
    isObscureRePassword = !isObscureRePassword;
    notifyListeners();
  }

  void validateInputs() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final repassword = repasswordController.text;

    ValidationManager validationManager = ValidationManager();
    validationManager.validateEmail(email);
    validationManager.validatePassword(password);
    validationManager.validateFullName(password);
    validationManager.validateRePassword(repassword, password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }
}
