import 'package:intl/intl.dart';

String rupiah(double rawValue) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  ).format(rawValue);
}
