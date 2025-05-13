import 'package:flutter/material.dart';
import 'package:hospital_booking/models/booking.dart';
import 'package:hospital_booking/models/test.dart';
import 'package:hospital_booking/models/time_slot.dart';

class BookingProvider extends ChangeNotifier {
  final List<Booking> _bookings = [];
  TimeSlot? _selectedSlot;
  MedicalTest? _selectedTest;

  List<Booking> get bookings => _bookings;
  TimeSlot? get selectedSlot => _selectedSlot;
  MedicalTest? get selectedTest => _selectedTest;

  void selectTest(MedicalTest test) {
    _selectedTest = test;
    notifyListeners();
  }

  void selectTimeSlot(TimeSlot slot) {
    _selectedSlot = slot;
    notifyListeners();
  }

  void addBooking() {
    if (_selectedTest != null && _selectedSlot != null) {
      final booking = Booking(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        test: _selectedTest!,
        timeSlot: _selectedSlot!,
        bookingDate: DateTime.now(),
      );
      _bookings.add(booking);
      _selectedSlot = null;
      _selectedTest = null;
      notifyListeners();
    }
  }

  void clearSelection() {
    _selectedSlot = null;
    _selectedTest = null;
    notifyListeners();
  }
}
