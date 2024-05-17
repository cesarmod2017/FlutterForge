class ResultErrorModel {
  String? message;
  ResultErrorModelState? modelState;

  ResultErrorModel({this.message, this.modelState});

  ResultErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    modelState = json['ModelState'] != null
        ? ResultErrorModelState.fromJson(json['ModelState'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    if (modelState != null) {
      data['ModelState'] = modelState!.toJson();
    }
    return data;
  }
}

class ResultErrorModelState {
  List<String>? erros;

  ResultErrorModelState({this.erros});

  ResultErrorModelState.fromJson(Map<String, dynamic> json) {
    erros = json['Erros'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Erros'] = erros;
    return data;
  }
}
