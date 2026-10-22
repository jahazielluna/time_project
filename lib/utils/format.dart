import 'package:intl/intl.dart';

final _mxn = NumberFormat.currency(
  locale: 'es_MX',
  symbol: '\$',
  decimalDigits: 2,
);

final _dateEs = DateFormat('d MMM yyyy', 'es');
final _dateShort = DateFormat('dd/MM/yyyy', 'es');

String formatMxn(double amount) => _mxn.format(amount);

String formatDate(DateTime d) => _dateEs.format(d);

String formatDateShort(DateTime d) => _dateShort.format(d);

String formatHours(int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h == 0) return '${m}m';
  if (m == 0) return '${h}h';
  return '${h}h ${m.toString().padLeft(2, '0')}m';
}

String formatHoursDecimal(int minutes) {
  return (minutes / 60).toStringAsFixed(2);
}

double amountFromMinutes(int minutes, double hourlyRate) {
  return (minutes / 60.0) * hourlyRate;
}

DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Inicio de semana (lunes) que contiene [d].
DateTime startOfWeek(DateTime d) {
  final day = dateOnly(d);
  return day.subtract(Duration(days: day.weekday - 1));
}

DateTime endOfWeek(DateTime d) =>
    startOfWeek(d).add(const Duration(days: 6));

DateTime startOfMonth(DateTime d) => DateTime(d.year, d.month, 1);

DateTime endOfMonth(DateTime d) => DateTime(d.year, d.month + 1, 0);

/// Quincena: 1–15 o 16–fin de mes.
({DateTime start, DateTime end}) biweeklyRange(DateTime d) {
  if (d.day <= 15) {
    return (start: DateTime(d.year, d.month, 1), end: DateTime(d.year, d.month, 15));
  }
  return (start: DateTime(d.year, d.month, 16), end: endOfMonth(d));
}
