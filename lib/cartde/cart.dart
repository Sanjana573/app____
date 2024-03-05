import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/mobilelist.dart';
import 'package:untitled/profile.dart';

import '../checkout/address.dart';

class Product {
  final String name;
  final String details;
  int quantity;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.details,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class CartProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addToCart(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}

class ShoppingCart {
  List<Product> products = [];
}

class Cart extends StatelessWidget {
  final ShoppingCart shoppingCart = ShoppingCart();

  Cart() {
    shoppingCart.products = [
      Product(
        name: 'Sample Product 1',
        details: 'Product details 1',
        quantity: 2,
        price: 19999,
        imageUrl:
            'https://static.toiimg.com/photo/80635304/Apple-iPhone-14-Pro-Max-512GB-6GB-RAM.jpg',
      ),
      Product(
        name: 'Sample Product 2',
        details: 'Product details 2',
        quantity: 1,
        price: 29999,
        imageUrl:
            'https://static.toiimg.com/photo/80635304/Apple-iPhone-14-Pro-Max-512GB-6GB-RAM.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBagPage(shoppingCart: shoppingCart),
    );
  }
}

class MyBagPage extends StatefulWidget {
  final ShoppingCart shoppingCart;

  MyBagPage({required this.shoppingCart});

  @override
  _MyBagPageState createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  void _handleCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddressEntryPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ECommerceApp()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 8),
            Text('My Bag'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: widget.shoppingCart.products.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: widget.shoppingCart.products[index],
                  onUpdate: (Function updateCallback) {
                    setState(() {
                      updateCallback();
                    });
                  },
                );
              },
            ),
          ),
          TotalAmountSection(shoppingCart: widget.shoppingCart),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleCheckout,
        label: Text('CHECK OUT'),
        icon: Icon(Icons.shopping_cart),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the index of the "Cart" tab
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: null, // Remove the blue color for the home button
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Mobiles',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,
                color: Colors.blue), // Colored cart icon
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ECommerceApp()),
            );
          }
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onUpdate;

  ProductItem({required this.product, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        height: 60,
        width: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/placeholder_image.jpg', // Replace with the path to your placeholder image
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          );
        },
      ),
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.details),
          SizedBox(height: 4),
          Text(
            'Price: ₹${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (product.quantity > 1) {
                onUpdate(() {
                  product.quantity -= 1;
                });
              }
            },
          ),
          Text('${product.quantity}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              onUpdate(() {
                product.quantity += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

class TotalAmountSection extends StatelessWidget {
  final ShoppingCart shoppingCart;

  TotalAmountSection({required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (var product in shoppingCart.products) {
      totalAmount += product.price * product.quantity;
    }

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Total Amount:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(formatCurrency(totalAmount)),
        ],
      ),
    );
  }
}

String formatCurrency(double amount) {
  return '₹${amount.toStringAsFixed(2)}';
}
