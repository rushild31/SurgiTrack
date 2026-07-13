class PatientValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "Enter $fieldName";
    }

    return null;
  }

  static String? validateEF(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final ef = double.tryParse(value.trim());

    if (ef == null) {
      return "Enter valid EF";
    }

    if (ef < 0 || ef > 100) {
      return "EF should be between 0-100%";
    }

    return null;
  }

  static String? validateDate(DateTime? date, String fieldName) {
    if (date == null) {
      return "Select $fieldName";
    }

    return null;
  }
}
