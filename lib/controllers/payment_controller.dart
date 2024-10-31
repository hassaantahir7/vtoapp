import '../models/payment_details.dart';

class PaymentController {
  PaymentDetails _paymentDetails = PaymentDetails(
    cardHolderName: '',
    cardNumber: '',
    expiryDate: '',
    cvc: '',
  );

  PaymentDetails get paymentDetails => _paymentDetails;

  void updateCardHolderName(String name) {
    _paymentDetails.cardHolderName = name;
  }

  void updateCardNumber(String number) {
    _paymentDetails.cardNumber = number;
  }

  void updateExpiryDate(String date) {
    _paymentDetails.expiryDate = date;
  }

  void updateCVC(String cvc) {
    _paymentDetails.cvc = cvc;
  }

  bool validatePaymentDetails() {
    return _paymentDetails.cardHolderName.isNotEmpty &&
        _paymentDetails.cardNumber.length == 16 &&
        _paymentDetails.expiryDate.isNotEmpty &&
        _paymentDetails.cvc.length == 3;
  }
}
