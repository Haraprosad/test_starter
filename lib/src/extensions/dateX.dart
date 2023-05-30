extension DateX on DateTime {
  String toLogDate() {
    return "$day/$month -> $hour:$minute:$second";
  }
}
