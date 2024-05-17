class CommandMessageModel {
  String? message;
  DateTime? date;
  bool? isError;

  CommandMessageModel({
    this.message,
    this.date,
    this.isError,
  });

  void newLine() {
    message = "=================================";
    date = DateTime.now();
    isError = false;
  }

  void write(String msg, {bool error = false}) {
    message = msg;
    date = DateTime.now();
    isError = error;
  }
}
