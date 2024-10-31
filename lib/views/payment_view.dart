import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/payment_controller.dart';
import 'order_failed_view.dart';
import 'order_success_view.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final PaymentController _controller = PaymentController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Payment', style: TextStyle(color: Color(0xff02D0C57),fontSize: 20,fontWeight: FontWeight.w600))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.check_circle_outlined, color: Color(0xff061023)),
                    Text('Details'),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right:
                    10,bottom: 20),
                    child: Divider(
                      color: Color(0xff061023),
                      thickness: 2.5,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.radio_button_checked, color: Color(0xff061023)),
                    Text('Payment'),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                    child: Divider(
                      color: Color(0xffE3E9F1),
                      thickness: 2.5,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.radio_button_checked, color: Color(0xffE3E9F1)),
                    Text('Confirmation',style: TextStyle(
                      fontWeight:FontWeight.w500,fontSize: 12,color: Color(0xffDDE1E6)
                    ),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/cardGradient.png'),
                    fit: BoxFit.cover),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Image.asset('assets/mc.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '5703 4547 2389 0030',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'MUHAMMAD NADEEM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '07/26',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Payment Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name on card',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        _controller.updateCardHolderName(value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the cardholder name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      suffixIcon: Image.asset('assets/mc.png',scale: 01.5),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    onChanged: (value) => _controller.updateCardNumber(value),
                    validator: (value) {
                      if (value == null || value.length != 16) {
                        return 'Card number must be 16 digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Expiry date',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                          maxLength: 4,
                          onChanged: (value) =>
                              _controller.updateExpiryDate(value),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length != 4) {
                              return 'Please enter valid expiry date';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'CVC',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.credit_card,size:40,color: Color(0xffD9D0E3),)
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          onChanged: (value) => _controller.updateCVC(value),
                          validator: (value) {
                            if (value == null || value.length != 3) {
                              return 'CVC must be 3 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    if (_controller.validatePaymentDetails()) {

                      bool paymentSuccess =
                          true;

                      if (paymentSuccess) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderSuccessView()),
                        );
                      } else {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderFailureView()),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid payment details')),
                      );
                    }
                  }
                },
                child: Text(
                  'PROCEED',
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
