class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });

  String getFormattedDate() {
    final d = dateTime.day.toString().padLeft(2, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final y = dateTime.year;
    return "$d.$m.$y";
  }

  String getFormattedTime() {
    final h = dateTime.hour.toString().padLeft(2, '0');
    final min = dateTime.minute.toString().padLeft(2, '0');
    return "$h:$min";
  }

  bool isPast() {
    return dateTime.isBefore(DateTime.now());
  }

  String getTimeUntilExam() {
    if (isPast()) return "Испитот веќе помина";
    final now = DateTime.now();
    final diff = dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }
}
