class DriversideValadation {
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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter the Name !!!';
    } else {
      return null;
    }
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter the Address !!!';
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String? value) {
    final phoneRegex = RegExp(r"^\d{4}\d{7}$");
    if (value == null || value.isEmpty) {
      return 'Enter the phone number';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number (e.g., 03324145420)';
    } else {
      return null;
    }
  }

  String? validateDriverCNIC(String? value) {
    final cnicRegex = RegExp(r"^\d{5}-\d{7}-\d{1}$");
    if (value == null || value.isEmpty) {
      return 'Enter the CNIC number';
    } else if (!cnicRegex.hasMatch(value)) {
      return 'Enter a valid CNIC number (e.g., 32102-5799182-5)';
    } else {
      return null;
    }
  }
}
