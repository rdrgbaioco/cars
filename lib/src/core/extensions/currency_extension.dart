import 'package:intl/intl.dart';


/// Extensão para formatação correta dos valores monetarios.
extension CurrencyExtension on double {
  String get toCurrency {
    return NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$ ',
      decimalDigits: 3,
    ).format(this);
  }
}