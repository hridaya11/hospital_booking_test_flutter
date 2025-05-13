import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital_booking/models/test.dart';
import 'package:hospital_booking/models/time_slot.dart';
import 'package:hospital_booking/providers/booking_provider.dart';
import 'package:hospital_booking/screens/booking_confirmation_screen.dart';
import 'package:hospital_booking/utils/mock_data.dart';

class SlotBookingScreen extends StatefulWidget {
  final MedicalTest test;

  const SlotBookingScreen({Key? key, required this.test}) : super(key: key);

  @override
  State<SlotBookingScreen> createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  final List<TimeSlot> _timeSlots = MockData.getTimeSlots();
  String _selectedDate = '';
  TimeSlot? _selectedSlot;

  @override
  void initState() {
    super.initState();
    if (_timeSlots.isNotEmpty) {
      _selectedDate = _timeSlots[0].date;
    }
  }

  List<String> _getUniqueDates() {
    return _timeSlots.map((slot) => slot.date).toSet().toList();
  }

  List<TimeSlot> _getSlotsByDate(String date) {
    return _timeSlots.where((slot) => slot.date == date).toList();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueDates = _getUniqueDates();
    final filteredSlots = _getSlotsByDate(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Time Slot'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.test.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Duration: ${widget.test.estimatedTime} • \$${widget.test.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Date',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: uniqueDates.length,
                    itemBuilder: (context, index) {
                      final date = uniqueDates[index];
                      final isSelected = date == _selectedDate;
                      
                      // Parse the date string to get day and month
                      final dateParts = date.split('/');
                      final day = dateParts[0];
                      final month = _getMonthName(int.parse(dateParts[1]));
                      
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                            _selectedSlot = null;
                          });
                        },
                        child: Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                month,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isSelected ? Colors.white70 : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Time Slots',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredSlots.length,
                  itemBuilder: (context, index) {
                    final slot = filteredSlots[index];
                    final isSelected = _selectedSlot == slot;
                    
                    return GestureDetector(
                      onTap: () {
                        if (slot.isAvailable) {
                          setState(() {
                            _selectedSlot = slot;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !slot.isAvailable
                              ? Colors.grey.shade200
                              : isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: !slot.isAvailable
                                ? Colors.grey.shade300
                                : isSelected
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            slot.time,
                            style: TextStyle(
                              color: !slot.isAvailable
                                  ? Colors.grey
                                  : isSelected
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedSlot == null
                    ? null
                    : () {
                        final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
                        bookingProvider.selectTest(widget.test);
                        bookingProvider.selectTimeSlot(_selectedSlot!);
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingConfirmationScreen(),
                          ),
                        );
                      },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
