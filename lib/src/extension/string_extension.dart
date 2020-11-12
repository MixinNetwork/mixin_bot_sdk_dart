extension StringExtension on String {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    }

    return isEmpty;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
