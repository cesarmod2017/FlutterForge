extension BoolExtensionsString on String {}

extension BoolExtensionsInt on int {
  bool isStatusOk() {
    return (this >= 200 && this < 205);
  }

  bool isStatus404() {
    return (this == 404);
  }

  bool isStatus401() {
    return (this == 401);
  }

  bool isStatus500() {
    return (this == 500);
  }

  String formatVersionCode() {
    String versionString = toString();
    return '${versionString.substring(0, 1)}.${versionString.substring(1, 3)}.${versionString.substring(3)}';
  }
}
