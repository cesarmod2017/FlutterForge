class DynamicExtensions {
  static double toCastDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      return 0;
    }
  }
}
