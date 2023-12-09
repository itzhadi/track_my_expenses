import 'package:intl/intl.dart';

class HelperFunctions {
  static NumberFormat _myFormat = NumberFormat.decimalPattern('en_us');
  static getNumberFormat(int val) => val > 9999 ? _myFormat.format(val) : val;
  static getDateFormat(DateTime date) => DateFormat('dd-MM-yyyy').format(date);
  static getZeroChain(String val) => int.tryParse(val)! < 10 ? '0' + val : val;
  static int getMonthNumber(String monthName) {
    switch (monthName.toLowerCase()) {
      case 'ינואר':
        return 1;
      case 'פברואר':
        return 2;
      case 'מרץ':
        return 3;
      case 'אפריל':
        return 4;
      case 'מאי':
        return 5;
      case 'יוני':
        return 6;
      case 'יולי':
        return 7;
      case 'אוגוסט':
        return 8;
      case 'ספטמבר':
        return 9;
      case 'אוקטובר':
        return 10;
      case 'נובמבר':
        return 11;
      case 'דצמבר':
        return 12;
      default:
        throw ArgumentError('Invalid month name: $monthName');
    }
  }
}
