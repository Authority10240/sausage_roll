import 'package:intl/intl.dart';
extension DateExtension on String{

  String toFormattedDate(){
    return DateFormat('dd MMM yyyy').format(DateTime.parse(this));
  }
}