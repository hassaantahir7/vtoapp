class PaymentDetails {
  String cardHolderName;
  String cardNumber;
  String expiryDate;
  String cvc;

  PaymentDetails({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvc,
  });
}
