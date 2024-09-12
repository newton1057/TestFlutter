// lib/models/promotion.dart
class Promotion {
  final String code;
  final String name;
  final String client;
  final DateTime expirationDate;

  Promotion({
    required this.code,
    required this.name,
    required this.client,
    required this.expirationDate,
  });
}