import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/users/cart.dart'; // Import your cart class

class CartWidget extends StatelessWidget {
  final Cart cart;

  const CartWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2, // Add elevation for a shadow effect
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Items: ${cart.totalItems}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Price: ₹${cart.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Weight: ${cart.totalWeight}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Implement checkout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button color
              ).copyWith(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color
                  ),
                ),
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
