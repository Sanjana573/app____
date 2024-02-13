import 'package:flutter/material.dart';

import 'cart.dart';
import 'homepage.dart';
import 'mobilelist.dart';
import 'profile.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();

  String selectedCardType = 'VISA'; // Default card type
  bool showUpiIdField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*Text(
                'User Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Delivery Address',
                  hintText: 'Enter your delivery address',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle saving address logic
                  _saveAddress();
                },
                child: Text('Save Address'),
              ),
              SizedBox(height: 24),*/
              Text(
                'Card Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedCardType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCardType = newValue!;
                  });
                },
                items: ['VISA', 'RuPay', 'See All']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 12),
              TextField(
                controller: nameOnCardController,
                decoration: InputDecoration(
                  labelText: 'Name on Card',
                  hintText: 'Enter the name on your card',
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter your 16-digit card number',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: 'Enter CVV',
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle UPI payment logic
                  setState(() {
                    showUpiIdField = true;
                  });
                },
                child: Text('UPI'),
              ),
              if (showUpiIdField)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 12),
                    TextField(
                      controller: upiIdController,
                      decoration: InputDecoration(
                        labelText: 'UPI ID',
                        hintText: 'Enter your UPI ID (e.g., abc@oksbi)',
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 24),
              Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              _buildOrderSummary(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle payment logic
                  _handlePayment();
                },
                child: Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the index of the "Profile" tab
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MobilesPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildOrderSummary() {
    // Replace this with your actual order summary data
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal:'),
            Text('₹431,898'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping:'),
            Text('₹30'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total (Tax incl):'),
            Text('₹431,928'),
          ],
        ),
      ],
    );
  }

  void _handleUPIPayment() {
    // Add logic for UPI payment
    print('Initiating UPI payment');
  }

  void _handlePayment() {
    // Add your payment processing logic here
    // For now, let's just navigate to the PaymentConfirmationPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentConfirmationPage()),
    );
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 64),
            SizedBox(height: 16),
            Text(
              'Payment Successful!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text('Thank you for your purchase.'),
          ],
        ),
      ),
    );
  }
}
