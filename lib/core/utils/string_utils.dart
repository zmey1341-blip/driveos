class StringUtils {
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String formatPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return '';
    
    final digits = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length >= 10) {
      return '+${digits.substring(0, 1)} (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7, 9)}-${digits.substring(9, 11)}';
    }
    return phoneNumber;
  }

  static String truncate(String value, int maxLength) {
    return value.length > maxLength ? '${value.substring(0, maxLength)}...' : value;
  }
}
