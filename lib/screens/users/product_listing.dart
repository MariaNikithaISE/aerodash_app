import 'package:flutter/material.dart';
import 'package:drone_app_1/screens/users/category_product_listing.dart';
import 'package:drone_app_1/screens/users/cart__widget.dart';
import 'package:drone_app_1/screens/users/cart.dart';
import 'package:drone_app_1/screens/users/cart_page.dart';
import 'dart:math';

class ProductListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your location',
                style: TextStyle(
                  fontFamily: 'SpaceG',
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'SpaceG',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Open user profile
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF6CD8D4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "What's on your shopping list today?",
                      style: TextStyle(
                        fontFamily: 'SpaceG',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryProductListingPage(
                                  category: category['name'],
                                  cart: Cart(), // Pass your cart instance here
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  category['image'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  category['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'SpaceG',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Popular Deals',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopularDealsCarousel(),
                    SizedBox(height: 16), // Add some spacing at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color(0xFFADE8E6),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF6CD8D4),
                ),
                child: Icon(Icons.location_on, color: Colors.white),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> categories = [
  {'name': 'Vegetables', 'image': 'assets/vegetables.png'},
  {'name': 'Fruits', 'image': 'assets/fruits.jpg'},
  {'name': 'Dairy', 'image': 'assets/dairy.jpg'},
  {'name': 'Essentials', 'image': 'assets/essentials.jpg'},
  {'name': 'Pulses', 'image': 'assets/pulses.jpeg'},
  {'name': 'Selfcare', 'image': 'assets/selfcare.png'},
  {'name': 'Wellness', 'image': 'assets/wellness.png'},
];

class PopularDealsCarousel extends StatefulWidget {
  @override
  _PopularDealsCarouselState createState() => _PopularDealsCarouselState();
}

class _PopularDealsCarouselState extends State<PopularDealsCarousel> {
  int _currentIndex = 0;

  final List<Map<String, String>> deals = [
    {
      'title': '20% off on your first order',
      'code': 'First20',
      'color': '#FF5733',
    },
    {
      'title': '30% off on selected items',
      'code': 'SpringSale',
      'color': '#33FFB8',
    },
    {
      'title': 'Buy 2 get 1 free',
      'code': 'Buy2Get1',
      'color': '#3378FF',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselItem(deal: deals[_currentIndex]),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  deals.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _currentIndex = (_currentIndex - 1) % deals.length;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              _currentIndex = (_currentIndex + 1) % deals.length;
            });
          },
        ),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  final Map<String, String> deal;

  CarouselItem({Key? key, required this.deal}) : super(key: key);

  final List<Color> pastelColors = [
    Color(0xFFBBE5E5),
    Color(0xFFC7CEEA),
    Color(0xFFF9E0AE),
    Color(0xFFA2D2FF),
    Color(0xFFD4A5A5),
  ];

  @override
  Widget build(BuildContext context) {
    Color bgColor = pastelColors[Random().nextInt(pastelColors.length)];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            deal['title'] ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Use code: ${deal['code']}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
