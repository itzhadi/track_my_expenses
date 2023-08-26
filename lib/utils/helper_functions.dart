import 'package:intl/intl.dart';

class HelperFunctions {
  static NumberFormat _myFormat = NumberFormat.decimalPattern('en_us');
  static getNumberFormat(int val) => val > 9999 ? _myFormat.format(val) : val;
  static getDateFormat(DateTime date) => DateFormat('dd-MM-yyyy').format(date);
  static getZeroChain(String val) => int.tryParse(val)! < 10 ? '0' + val : val;
}
