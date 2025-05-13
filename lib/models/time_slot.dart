class TimeSlot {
  final String id;
  final String time;
  final String date;
  final bool isAvailable;

  TimeSlot({
    required this.id,
    required this.time,
    required this.date,
    this.isAvailable = true,
  });
}
