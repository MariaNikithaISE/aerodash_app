import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/users/cart__widget.dart';
import 'package:drone_app_1/screens/users/cart.dart';
import 'package:drone_app_1/screens/users/cart_page.dart';

class CategoryProductListingPage extends StatefulWidget {
  final String category;
  final Cart cart;

  const CategoryProductListingPage({
    Key? key,
    required this.category,
    required this.cart,
  }) : super(key: key);

  @override
  _CategoryProductListingPageState createState() => _CategoryProductListingPageState();
}

class _CategoryProductListingPageState extends State<CategoryProductListingPage> {
  late List<Map<String, dynamic>> productList;

  @override
  void initState() {
    super.initState();
    productList = _getProductList();
  }

  List<Map<String, dynamic>> _getProductList() {
    final Map<String, List<Map<String, dynamic>>> products = {
      'Vegetables': [
        {
          'name': 'Tomato',
          'image': 'assets/veg/tomato.jpg',
          'weight': '250g',
          'price': 20
        },
        {
          'name': 'Potato',
          'image': 'assets/veg/potato.jpg',
          'weight': '500g',
          'price': 30
        },
        {
          'name': 'Carrot',
          'image': 'assets/veg/carrot.jpg',
          'weight': '200g',
          'price': 25
        },
        {
          'name': 'Broccoli',
          'image': 'assets/veg/broccoli.jpg',
          'weight': '300g',
          'price': 35
        },
        {
          'name': 'Onion',
          'image': 'assets/veg/onion.jpg',
          'weight': '200g',
          'price': 10
        },
      ],
      'Fruits': [
        {
          'name': 'Apple',
          'image': 'assets/fruits/apple.jpg',
          'weight': '200g',
          'price': 50
        },
        {
          'name': 'Banana',
          'image': 'assets/fruits/banana.jpg',
          'weight': '300g',
          'price': 40
        },
        {
          'name': 'Orange',
          'image': 'assets/fruits/orange.jpg',
          'weight': '250g',
          'price': 35
        },
        {
          'name': 'Grapes',
          'image': 'assets/fruits/grapes.jpg',
          'weight': '500g',
          'price': 60
        },
        {
          'name': 'Pineapple',
          'image': 'assets/fruits/pineapple.jpg',
          'weight': '1kg',
          'price': 70
        },
        {
          'name': 'Watermelon',
          'image': 'assets/fruits/watermelon.jpg',
          'weight': '5kg',
          'price': 80
        },
      ],
      'Dairy': [
        {
          'name': 'Milk',
          'image': 'assets/dairy/dairy.jpg',
          'weight': '1L',
          'price': 25
        },
        {
          'name': 'Cheese',
          'image': 'assets/dairy/cheese.jpg',
          'weight': '250g',
          'price': 40
        },
        {
          'name': 'Yogurt',
          'image': 'assets/dairy/yogurt.jpg',
          'weight': '500g',
          'price': 30
        },
        {
          'name': 'Butter',
          'image': 'assets/dairy/butter.jpg',
          'weight': '200g',
          'price': 35
        },
      ],
      'Essentials': [
        {
          'name': 'Rice',
          'image': 'assets/essentials/img.png',
          'weight': '1kg',
          'price': 60
        },
        {
          'name': 'Bread',
          'image': 'assets/essentials/bread.jpg',
          'weight': '500g',
          'price': 20
        },
        {
          'name': 'Oil',
          'image': 'assets/essentials/oil.jpg',
          'weight': '1L',
          'price': 100
        },
        {
          'name': 'Salt',
          'image': 'assets/essentials/salt.jpg',
          'weight': '500g',
          'price': 15
        },
      ],
      'Pulses': [
        {
          'name': 'Lentils',
          'image': 'assets/pulses/lentils.jpg',
          'weight': '500g',
          'price': 45
        },
        {
          'name': 'Beans',
          'image': 'assets/pulses/beans.jpg',
          'weight': '500g',
          'price': 50
        },
        {
          'name': 'Chickpeas',
          'image': 'assets/pulses/chickpeas.jpg',
          'weight': '500g',
          'price': 55
        },
        {
          'name': 'Dal',
          'image': 'assets/pulses/dal.jpg',
          'weight': '500g',
          'price': 60
        },
      ],
      'Selfcare': [
        {
          'name': 'Shampoo',
          'image': 'assets/selfcare/shampoo.jpg',
          'weight': '250ml',
          'price': 70
        },
        {
          'name': 'Soap',
          'image': 'assets/selfcare/soap.png',
          'weight': '75g',
          'price': 20
        },
        {
          'name': 'Toothpaste',
          'image': 'assets/selfcare/toothpaste.png',
          'weight': '100g',
          'price': 30
        },
        {
          'name': 'Lotion',
          'image': 'assets/selfcare/lotion.jpg',
          'weight': '200ml',
          'price': 50
        },
      ],
      'Wellness': [
        {
          'name': 'Vitamins',
          'image': 'assets/wellness/vitamins.jpg',
          'weight': '30 capsules',
          'price': 100
        },
        {
          'name': 'Supplements',
          'image': 'assets/wellness/supplements.jpg',
          'weight': '30 capsules',
          'price': 120
        },
        {
          'name': 'Herbal tea',
          'image': 'assets/wellness/herbaltea.jpg',
          'weight': '25 bags',
          'price': 80
        },
        {
          'name': 'Essential oils',
          'image': 'assets/wellness/essential_oils.jpg',
          'weight': '10ml',
          'price': 150
        },
      ],
    };
    return products[widget.category] ?? [];
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          int quantity = widget.cart.items
              .where((item) => item.name == product['name'])
              .fold(0, (total, item) => total + item.quantity);
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Weight: ${product['weight']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) {
                          widget.cart.decrementItemQuantity(product['name']);
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.cart.incrementItemQuantity(product['name']);
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      widget.cart.addItem(
                        CartItem(
                          name: product['name'],
                          weight: product['weight'],
                          price: product['price'],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}