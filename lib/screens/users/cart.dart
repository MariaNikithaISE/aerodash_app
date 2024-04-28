import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String weight;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.weight,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });
}

class Cart {
  List<CartItem> items = [];

  // Method to add an item to the cart
  void addItem(CartItem item) {
    items.add(item);
  }

  // Method to get all items in the cart
  List<CartItem> getItems() {
    return items;
  }

  void incrementItemQuantity(String itemName) {
    for (var item in items) {
      if (item.name == itemName) {
        item.quantity++;
        break;
      }
    }
  }

  // Method to decrement the quantity of a specific item in the cart
  void decrementItemQuantity(String itemName) {
    for (var item in items) {
      if (item.name == itemName && item.quantity > 1) {
        item.quantity--;
        break;
      }
    }
  }

  // Getter to calculate the total price of all items in the cart
  double get totalPrice {
    return items.fold(0, (total, item) => total + (item.price * item.quantity));
  }

  // Getter to calculate the total number of items in the cart
  int get totalItems {
    return items.length;
  }

  // Getter to calculate the total weight of all items in the cart
  double get totalWeight {
    return items.fold(0, (total, item) => total + (double.parse(item.weight.replaceAll('g', '')) * item.quantity));
  }
}
