import 'package:flutter/material.dart';
import 'package:untitled/cart.dart';
import 'package:untitled/mobilelist.dart';
import 'package:untitled/profile.dart';
import 'iphone13.dart';
import 'iphone14.dart';
import 'samsungs24ultra5g.dart';
import 'googlepixel6pro5g.dart';
import 'oneplus9pro.dart';
import 'oneplusnordce35g.dart';
import 'iphone15promax.dart';
import 'oppoa78.dart';

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
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

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> mobiles = [
    {
      'name': 'iPhone 13',
      'image':
      'https://assets.sangeethamobiles.com/product_img/8538/1667547711_A7D.jpg',
      'price': '\₹54,900',
    },
    {
      'name': 'Samsung S24 Ultra 5G ',
      'image':
      'https://www.reliancedigital.in/medias/Samsung-S-Series-Ultra-Mobile-Phone-494352159-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3w2NTk3OXxpbWFnZS9qcGVnfGltYWdlcy9oMzEvaGY0LzEwMTAyODc2NzY2MjM4LmpwZ3wwMmQyZmViZTk1YWNlNzU4YzZiNjAzN2VjNzFjOTM1NDEzYTQ1MDVhMmQ0NmExYTA2OGM1YzQ2MDM1NTJjYzY0',
      'price': '\₹1,39,999',
    },
    {
      'name': 'Google Pixel 6 Pro 5G',
      'image':
      'https://m.media-amazon.com/images/I/71FpXTBHDnL.SL1500.jpg',
      'price': '\₹39,599',
    },
    {
      'name': 'OnePlus 9 Pro',
      'image':
      'https://www.reliancedigital.in/medias/OnePlus-9-Pro-SmartPhones-491947280-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wyOTI4MDB8aW1hZ2UvanBlZ3xpbWFnZXMvaGFhL2g4Zi85ODY5MTEzNzUzNjMwLmpwZ3xkZTI2MDIxYjUwNmEyY2E2YjQwOWFmNTQ3Y2Y4YjdiY2YyYjVmM2I3ZmQxZDZmOWQ2MjMzMWQ0NTU3YzQ1M2M0',
      'price': '\₹46,316',
    },
    {
      'name': 'OnePlus Nord CE 3 5G',
      'image':
      'https://m.media-amazon.com/images/I/41TmlehQnaL.SX300_SY300_QL70_FMwebp.jpg',
      'price': '\₹27,999',
    },
    {
      'name': 'Oppo A78',
      'image':
      'https://m.media-amazon.com/images/I/510YrcEw3-L.SX300_SY300_QL70_FMwebp.jpg',
      'price': '\₹15,499',
    },
    {
      'name': 'Apple iPhone 15 Pro Max',
      'image':
      'https://m.media-amazon.com/images/I/41zb7hwFUmL.SY445_SX342_QL70_FMwebp.jpg',
      'price': '\₹1,56,900',
    },
    {
      'name': 'Apple iPhone 14 ',
      'image':
      'https://m.media-amazon.com/images/I/611mRs-imxL.SL1500.jpg',
      'price': '\₹65,999',
    },
    // Add more mobiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello-Mobiles'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false, // Remove the back button
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://img.freepik.com/free-vector/best-deal-70-percent-off-discount-offer-banner_91128-1599.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      // Navigate to the respective product details page
                      if (index == 0) {
                        // iPhone 13 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage1(),
                          ),
                        );
                      } else if (index == 1) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage2(),
                          ),
                        );
                      }
                      else if (index == 2) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage3(),
                          ),
                        );
                      }
                      else if (index == 3) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage4(),
                          ),
                        );
                      }
                      else if (index == 4) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage5(),
                          ),
                        );
                      }
                      else if (index == 5) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage6(),
                          ),
                        );
                      }
                      else if (index == 6) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage7(),
                          ),
                        );
                      }
                      else if (index == 7) {
                        // iPhone 14 tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage8(),
                          ),
                        );
                      }

                      // Add similar blocks for other products as needed
                    },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              mobiles[index]['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            mobiles[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Price: ${mobiles[index]['price']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: mobiles.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Mobiles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MobilesPage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          }
        },
      ),
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
      productName: 'iPhone 13',
      imageUrl:
      'https://assets.sangeethamobiles.com/product_img/8538/1667547711_A7D.jpg',

    ),
    SimilarProduct(
      productName: 'Samsung S24 Ultra 5G',
      imageUrl:
      'https://www.reliancedigital.in/medias/Samsung-S-Series-Ultra-Mobile-Phone-494352159-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3w2NTk3OXxpbWFnZS9qcGVnfGltYWdlcy9oMzEvaGY0LzEwMTAyODc2NzY2MjM4LmpwZ3wwMmQyZmViZTk1YWNlNzU4YzZiNjAzN2VjNzFjOTM1NDEzYTQ1MDVhMmQ0NmExYTA2OGM1YzQ2MDM1NTJjYzY0',

    ),
    SimilarProduct(
      productName: 'Google Pixel 6 Pro 5G',
      imageUrl:
      'https://m.media-amazon.com/images/I/71FpXTBHDnL.SL1500.jpg',
    ),
    SimilarProduct(
      productName: 'Apple iPhone 15 Pro Max',
      imageUrl:
      'https://m.media-amazon.com/images/I/41zb7hwFUmL.SY445_SX342_QL70_FMwebp.jpg',
    ),
    SimilarProduct(
      productName: 'OnePlus Nord CE 3 5G',
      imageUrl:
      'https://m.media-amazon.com/images/I/41TmlehQnaL.SX300_SY300_QL70_FMwebp.jpg',
    ),
    SimilarProduct(
      productName: 'Oppo A78',
      imageUrl:
      'https://m.media-amazon.com/images/I/510YrcEw3-L.SX300_SY300_QL70_FMwebp.jpg',

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
                        children: similarProducts.map((product) {
                          return SimilarProductCard(
                            productName: product.productName,
                            imageUrl: product.imageUrl,
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

  SimilarProductCard({
    required this.productName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Set a fixed width for the card
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80, // Set a fixed height for the image
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Adjust the fit property
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
    );
  }
}

void main() {
  runApp(ECommerceApp());
}