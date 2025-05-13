import 'package:hospital_booking/models/test.dart';
import 'package:hospital_booking/models/time_slot.dart';

class Booking {
  final String id;
  final MedicalTest test;
  final TimeSlot timeSlot;
  final DateTime bookingDate;

  Booking({
    required this.id,
    required this.test,
    required this.timeSlot,
    required this.bookingDate,
  });
}
