import 'package:intl/intl.dart';

class HelperFunctions{
   static bool creditOrDebit(double amount){
    if(amount > 0){
      return true;
    }
    else{
      return false;
    }
  }

  static String formatCustomDate(String isoDate) {
  final dateTime = DateTime.parse(isoDate).toLocal(); // or keep it UTC if needed
  final day = DateFormat('EEEE').format(dateTime);     // e.g., Tuesday
  final date = DateFormat('MMMM d').format(dateTime);  // e.g., April 1
  final year = DateFormat('y').format(dateTime);       // e.g., 2025
  return '$date, $day, $year';
}
}