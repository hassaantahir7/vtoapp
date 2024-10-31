// views/payment_method_view.dart
import 'package:flutter/material.dart';
import '../controllers/payment_method_controller.dart';
import '../models/payment_method_model.dart';

class PaymentMethodView extends StatefulWidget {
  @override
  _PaymentMethodViewState createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  final PaymentMethodController _controller = PaymentMethodController();
  late List<PaymentMethodModel> _paymentMethods;

  @override
  void initState() {
    super.initState();
    _paymentMethods = _controller.getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ..._paymentMethods.asMap().entries.map((entry) {
              int index = entry.key;
              PaymentMethodModel method = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.selectPaymentMethod(_paymentMethods, index);
                  });
                },
                child: PaymentMethodItem(
                  logoPath: method.logoPath,
                  cardNumber: method.cardNumber,
                  isSelected: method.isSelected,
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {

              },
              child: Text(
                'Add New',
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
                side: BorderSide(color: Colors.black),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final String logoPath;
  final String cardNumber;
  final bool isSelected;

  PaymentMethodItem({
    required this.logoPath,
    required this.cardNumber,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          logoPath,
          width: 50,
          height: 50,
        ),
        title: Padding(
          padding: EdgeInsets.only(
              left: 8.0),
          child: Text(cardNumber),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      ),
    );
  }
}
