// models/payment_method_model.dart
class PaymentMethodModel {
  final String logoPath;
  final String cardNumber;
  bool isSelected;

  PaymentMethodModel({
    required this.logoPath,
    required this.cardNumber,
    this.isSelected = false,
  });
}
