class ResultError {
  late String error;
  late int code;

  ResultError({required this.error, required this.code});

  ResultError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    return data;
  }
}

class ResultLoginError {
  late String error;
  late String errorDescription;

  ResultLoginError({required this.error, required this.errorDescription});

  ResultLoginError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['error_description'] = errorDescription;
    return data;
  }
}
