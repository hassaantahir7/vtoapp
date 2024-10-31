// views/order_success_view.dart
import 'package:flutter/material.dart';

import 'home_view.dart';

class OrderSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(color: Color(0xff02D0C57),fontSize: 20,fontWeight: FontWeight.w600)),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      Icon(Icons.check_circle_outlined, color: Color(0xff061023)),
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
                      Icon(Icons.check_circle_outlined, color: Color(0xff061023)),
                      Text('Confirmation',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffDDE1E6)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Image.asset('assets/paymentSuccess.png'),
              SizedBox(height: 20),
              Text(
                'Congrats! Your Order has \n been placed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff181725)
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Your order has been placed and is on \n its way to being processed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 12,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(Icons.shopping_bag_outlined,color: Color(0xffFFFFFF),size: 25,),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'CONTINUE SHOPPING',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Back to home',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
