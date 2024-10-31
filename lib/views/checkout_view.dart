import 'package:flutter/material.dart';
import 'package:shop/views/payment_view.dart';
import '../controllers/cart_controller.dart';
import '../models/cart_model.dart';
import '../widgets/bottomNavBar.dart';

class CheckoutView extends StatelessWidget {
  final CartController controller = CartController();

  @override
  Widget build(BuildContext context) {
    final cartItems = controller.getCartItems();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment',style: TextStyle(
          color: Color(0xff061023),fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 20, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.black),
                    Text('Details'),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom:20),
                    child: Divider(
                      color: Color(0xff061023),
                      thickness: 2.5,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.radio_button_checked, color: Color(0xffE3E9F1)),
                    Text('Payment',style: TextStyle(color: Color(0xffDDE1E6),fontWeight: FontWeight.w500,fontSize: 12),),
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
                    Text('Confirmation',style: TextStyle(color: Color(0xffDDE1E6),fontWeight: FontWeight.w500,fontSize: 12),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(cartItems[index], index);
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _buildSummarySection(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Image.asset(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(item.brand),
                  SizedBox(height: 5),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(item.size),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.decreaseQuantity(index);
                          },
                          icon: Icon(Icons.remove_circle),
                        ),
                        Text(
                          item.quantity.toString(),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.increaseQuantity(index);
                          },
                          icon: Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub total'),
            Text(
              '\$${controller.getSubtotal().toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping'),
            Text(
              '\$${controller.getShippingCost().toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total'),
            Text(
              '\$${controller.getTotal().toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}