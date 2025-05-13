import 'package:hospital_booking/models/test.dart';
import 'package:hospital_booking/models/time_slot.dart';

class MockData {
  static List<MedicalTest> getMedicalTests() {
    return [
      MedicalTest(
        id: '1',
        name: 'Complete Blood Count (CBC)',
        description: 'Measures different components of your blood including red and white blood cells, platelets, and hemoglobin.',
        price: 45.99,
        estimatedTime: '30 minutes',
        imageUrl: 'assets/images/cbc.jpg',
      ),
      MedicalTest(
        id: '2',
        name: 'Blood Glucose Test',
        description: 'Measures the amount of glucose (sugar) in your blood, used to diagnose and monitor diabetes.',
        price: 35.50,
        estimatedTime: '15 minutes',
        imageUrl: 'assets/images/glucose.jpg',
      ),
      MedicalTest(
        id: '3',
        name: 'Lipid Panel',
        description: 'Measures cholesterol levels and triglycerides to assess risk of heart disease.',
        price: 65.75,
        estimatedTime: '45 minutes',
        imageUrl: 'assets/images/lipid.jpg',
      ),
      MedicalTest(
        id: '4',
        name: 'Thyroid Function Test',
        description: 'Evaluates how well your thyroid gland is working by measuring hormone levels.',
        price: 85.00,
        estimatedTime: '1 hour',
        imageUrl: 'assets/images/thyroid.jpg',
      ),
      MedicalTest(
        id: '5',
        name: 'COVID-19 PCR Test',
        description: 'Detects genetic material from the SARS-CoV-2 virus that causes COVID-19.',
        price: 120.00,
        estimatedTime: '24-48 hours',
        imageUrl: 'assets/images/covid.jpg',
      ),
      MedicalTest(
        id: '6',
        name: 'Liver Function Test',
        description: 'Measures various enzymes and proteins to evaluate liver health and function.',
        price: 75.50,
        estimatedTime: '1 hour',
        imageUrl: 'assets/images/liver.jpg',
      ),
      MedicalTest(
        id: '7',
        name: 'Kidney Function Test',
        description: 'Evaluates how well your kidneys are working by measuring waste products in blood.',
        price: 70.25,
        estimatedTime: '45 minutes',
        imageUrl: 'assets/images/kidney.jpg',
      ),
      MedicalTest(
        id: '8',
        name: 'Electrocardiogram (ECG)',
        description: 'Records electrical signals in your heart to check for heart conditions.',
        price: 95.00,
        estimatedTime: '15 minutes',
        imageUrl: 'assets/images/ecg.jpg',
      ),
    ];
  }

  static List<TimeSlot> getTimeSlots() {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    final dayAfterTomorrow = today.add(const Duration(days: 2));
    
    final todayStr = '${today.day}/${today.month}/${today.year}';
    final tomorrowStr = '${tomorrow.day}/${tomorrow.month}/${tomorrow.year}';
    final dayAfterTomorrowStr = '${dayAfterTomorrow.day}/${dayAfterTomorrow.month}/${dayAfterTomorrow.year}';
    
    return [
      // Today slots
      TimeSlot(id: '1', time: '09:00 AM', date: todayStr),
      TimeSlot(id: '2', time: '10:00 AM', date: todayStr),
      TimeSlot(id: '3', time: '11:00 AM', date: todayStr, isAvailable: false),
      TimeSlot(id: '4', time: '12:00 PM', date: todayStr),
      TimeSlot(id: '5', time: '02:00 PM', date: todayStr),
      TimeSlot(id: '6', time: '03:00 PM', date: todayStr, isAvailable: false),
      TimeSlot(id: '7', time: '04:00 PM', date: todayStr),
      
      // Tomorrow slots
      TimeSlot(id: '8', time: '09:00 AM', date: tomorrowStr),
      TimeSlot(id: '9', time: '10:00 AM', date: tomorrowStr),
      TimeSlot(id: '10', time: '11:00 AM', date: tomorrowStr),
      TimeSlot(id: '11', time: '12:00 PM', date: tomorrowStr),
      TimeSlot(id: '12', time: '02:00 PM', date: tomorrowStr),
      TimeSlot(id: '13', time: '03:00 PM', date: tomorrowStr),
      TimeSlot(id: '14', time: '04:00 PM', date: tomorrowStr),
      
      // Day after tomorrow slots
      TimeSlot(id: '15', time: '09:00 AM', date: dayAfterTomorrowStr),
      TimeSlot(id: '16', time: '10:00 AM', date: dayAfterTomorrowStr),
      TimeSlot(id: '17', time: '11:00 AM', date: dayAfterTomorrowStr),
      TimeSlot(id: '18', time: '12:00 PM', date: dayAfterTomorrowStr),
      TimeSlot(id: '19', time: '02:00 PM', date: dayAfterTomorrowStr),
      TimeSlot(id: '20', time: '03:00 PM', date: dayAfterTomorrowStr),
      TimeSlot(id: '21', time: '04:00 PM', date: dayAfterTomorrowStr),
    ];
  }
}
