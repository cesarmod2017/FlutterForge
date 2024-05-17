extension DurationExtensions on Duration {
  String toTimeMS() {
    String formattedTime = toString().split('.')[0].padLeft(8, "0");
    List<String> timeParts = formattedTime.split(':');
    formattedTime = '${timeParts[1]}:${timeParts[2]}';
    return formattedTime;
  }

  String formatDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return "${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
