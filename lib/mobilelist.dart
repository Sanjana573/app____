import 'package:flutter/material.dart';
import 'package:untitled/cart.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/profile.dart';

class MobilesPage extends StatelessWidget {
  final List<Map<String, dynamic>> mobiles = [
    {
      'name': 'OnePlus',
      'image':
          'https://images.unsplash.com/photo-1589492477829-5e65395b66cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vYmlsZSUyMHBob25lfGVufDB8fDB8fHww/50',
      'price': '\$599',
    },
    {
      'name': 'Samsung',
      'image':
          'https://images.unsplash.com/photo-1589492477829-5e65395b66cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vYmlsZSUyMHBob25lfGVufDB8fDB8fHww/50',
      'price': '\$699',
    },
    {
      'name': 'iPhone',
      'image':
          'https://images.unsplash.com/photo-1589492477829-5e65395b66cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vYmlsZSUyMHBob25lfGVufDB8fDB8fHww/50',
      'price': '\$999',
    },
    {
      'name': 'Redmi',
      'image':
          'https://images.unsplash.com/photo-1589492477829-5e65395b66cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vYmlsZSUyMHBob25lfGVufDB8fDB8fHww/50',
      'price': '\$599',
    },
    // Add more mobiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobiles'),
        backgroundColor: Colors.white70,
      ),
      body: ListView.builder(
        itemCount: mobiles.length,
        itemBuilder: (context, index) {
          return MobileItemCard(mobile: mobiles[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the index of the "Profile" tab
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
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

class MobileItemCard extends StatefulWidget {
  final Map<String, dynamic> mobile;

  const MobileItemCard({Key? key, required this.mobile}) : super(key: key);

  @override
  _MobileItemCardState createState() => _MobileItemCardState();
}

class _MobileItemCardState extends State<MobileItemCard> {
  bool itemAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        widget.mobile['image'],
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.mobile['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Price: ${widget.mobile['price']}',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemAddedToCart = true;
                    });
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            if (itemAddedToCart) ...[
              Align(
                alignment: Alignment.centerRight,
                child: Text('Added to Cart',
                    style: TextStyle(color: Colors.green)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
