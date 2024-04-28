import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/users/splash_screen.dart';
import 'package:drone_app_1/screens/users/sign_in_page.dart';
import 'package:drone_app_1/screens/users/product_listing.dart';
import 'package:drone_app_1/screens/users/checkout.dart';
import 'package:drone_app_1/screens/users/category_product_listing.dart';
import 'package:drone_app_1/screens/users/cart__widget.dart';
import 'package:drone_app_1/screens/users/cart.dart';
import 'package:drone_app_1/screens/users/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart _cart = Cart(); // Create a default Cart object

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to '/'
      routes: {
        '/': (context) => SplashScreen(),
        '/signIn': (context) => SignInPage(),
        '/productListing': (context) => ProductListingPage(),
        '/checkout': (context) => CheckoutPage(cart: _cart), // Provide default Cart object to CheckoutPage
      },
    );
  }
}
