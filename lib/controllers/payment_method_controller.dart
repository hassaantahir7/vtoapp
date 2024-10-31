// controllers/payment_method_controller.dart
import '../models/payment_method_model.dart';

class PaymentMethodController {
  // Simulate fetching payment methods from an API or a database
  List<PaymentMethodModel> getPaymentMethods() {
    return [
      PaymentMethodModel(
        logoPath: 'assets/paypal.png',
        cardNumber: '2121 6352 8465 ****',
        isSelected: true, // Initially selected
      ),
      PaymentMethodModel(
        logoPath: 'assets/visa.png',
        cardNumber: '2121 6352 8465 ****',
      ),
      PaymentMethodModel(
        logoPath: 'assets/payoneer.png',
        cardNumber: '2121 6352 8465 ****',
      ),
    ];
  }

  // Update the selected payment method
  void selectPaymentMethod(List<PaymentMethodModel> methods, int index) {
    for (int i = 0; i < methods.length; i++) {
      methods[i].isSelected = (i == index);
    }
  }
}
