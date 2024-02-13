import 'package:flutter/material.dart';
import 'package:untitled/samsungs24ultra5g.dart';

import 'googlepixel6pro5g.dart';
import 'iphone13.dart';
import 'iphone14.dart';
import 'iphone15promax.dart';
import 'oneplusnordce35g.dart';
import 'oppoa78.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String condition;
  final String material;
  final String category;
  final int itemNumber;
  final int price;
  final int reviews;
  final int soldQuantity;
  final double rating;

  Product({
    required this.name,
    required this.condition,
    required this.material,
    required this.category,
    required this.itemNumber,
    required this.price,
    required this.reviews,
    required this.soldQuantity,
    required this.rating,
  });
}

class SimilarProduct {
  final String productName;
  final String imageUrl;

  SimilarProduct({
    required this.productName,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product = Product(
    name: 'iPhone 14 Pro Max',
    condition: 'Brand new',
    material: 'Plastic',
    category: 'Electronics, gadgets',
    itemNumber: 23421,
    price: 2127999,
    reviews: 32,
    soldQuantity: 154,
    rating: 4.5,
  );

  final List<SimilarProduct> similarProducts = [
    SimilarProduct(
      productName: 'Samsung S23 Ultra 5G',
      imageUrl:
          'https://cdn1.smartprix.com/rx-izLSMVlI0-w1200-h1200/zLSMVlI0.jpg',
    ),
    SimilarProduct(
      productName: 'Phone 14 Pro',
      imageUrl:
          'https://static.toiimg.com/photo/80635304/Apple-iPhone-14-Pro-Max-512GB-6GB-RAM.jpg',
    ),
    SimilarProduct(
      productName: 'Pixel 8 Pro',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/rDsWwogtufZ6wpYuRqE8XY-970-80.jpg',
    ),
    SimilarProduct(
      productName: 'OnePlus 9',
      imageUrl:
          'https://specifications-pro.com/wp-content/uploads/2020/10/OnePlus-9-1.jpg',
    ),
    SimilarProduct(
      productName: 'Xiaomi Mi 11 Pro',
      imageUrl:
          'https://www.teknofilo.com/wp-content/uploads/2021/01/Xiaomi-Mi-11-Pro.jpg',
    ),
    SimilarProduct(
      productName: 'Google Pixel 6',
      imageUrl:
          'https://mobidevices.com/images/2021/05/Google-Pixel-6-Pro_1.jpg',
    ),
    // Add more SimilarProduct instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
                'https://static.toiimg.com/photo/80635304/Apple-iPhone-14-Pro-Max-512GB-6GB-RAM.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          // Display 5 stars
                          if (index < product.rating.floor()) {
                            return Icon(Icons.star,
                                color: Colors.yellow); // Fully filled star
                          } else if (index == product.rating.floor()) {
                            // Half-filled star
                            return Icon(Icons.star_half, color: Colors.yellow);
                          } else {
                            return Icon(Icons.star_border,
                                color: Colors.black); // Empty star
                          }
                        }),
                      ),
                      SizedBox(width: 4),
                      Text('${product.reviews} reviews'),
                      SizedBox(width: 16),
                      Icon(Icons.shopping_cart,
                          color: Colors.grey), // Grey cart icon
                      SizedBox(width: 4),
                      Text('${product.soldQuantity} sold'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: ₹${product.price}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Quantity: 50-100 pcs'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Buy Now action
                    },
                    child: Text('Buy Now'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Add to Cart action
                    },
                    child: Text('Add to Cart'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Product Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Condition: ${product.condition}'),
                  Text('Material: ${product.material}'),
                  Text('Category: ${product.category}'),
                  Text('Item Number: ${product.itemNumber}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Read More action
                    },
                    child: Text('Read More'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Similar Products:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: similarProducts.asMap().entries.map((entry) {
                          int index = entry.key;
                          SimilarProduct product = entry.value;

                          return SimilarProductCard(
                            productName: product.productName,
                            imageUrl: product.imageUrl,
                            index: index,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the index of the "Cart" tab
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: null, // Remove the blue color for home button
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Mobiles',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,
                color: Colors.grey), // Colored cart icon
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {


        },
      ),
    );
  }
}

class SimilarProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final int index;

  SimilarProductCard({
    required this.productName,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to different pages based on the product name
        switch (productName) {
          case 'iPhone 13':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage1(),
              ),
            );
            break;
          case 'iPhone 14':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage8(),
              ),
            );
            break;
          case 'Samsung S24 Ultra 5G':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage2(),
              ),
            );
            break;
          case 'Google Pixel 6 Pro 5G':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage3(),
              ),
            );
            break;
          case 'Apple iPhone 15 Pro Max':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage7(),
              ),
            );
            break;
          case 'OnePlus Nord CE 3 5G':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage5(),
              ),
            );
            break;
          case 'Oppo A78':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage6(),
              ),
            );
            break;
        // Add more cases for other products as needed
          default:
          // Handle the default case if necessary
            break;
        }
      },
      child: Container(
        width: 120,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
