extension DoubleExtension on double {
  String get toCurrency => 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
}
