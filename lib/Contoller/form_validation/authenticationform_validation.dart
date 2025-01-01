class AuthenticationformValidation {
  String? validateEmail(String? value) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value == null || value.isEmpty) {
      return "Enter the email";
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  // Password Validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Fill the field mandatory';
    } else {
      return null;
    }
  }
}
