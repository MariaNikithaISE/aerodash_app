import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/users/cart.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = cart.getItems();

    double totalPrice = 0.0;
    double totalWeight = 0.0;

    // Calculate total price and total weight
    cartItems.forEach((item) {
      totalPrice += item.price;
      totalWeight += double.parse(item.weight.split(' ')[0]); // Extracting the weight and converting it to double
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('Weight: ${cartItem.weight}, Price: ₹${cartItem.price}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Price: ₹${totalPrice.toStringAsFixed(2)}', // Displaying total price rounded to 2 decimal places
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Weight: ${totalWeight.toStringAsFixed(2)}', // Displaying total weight rounded to 2 decimal places
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
