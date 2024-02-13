import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/payment.dart';

class AddressEntryPage extends StatefulWidget {
  const AddressEntryPage({Key? key}) : super(key: key);

  @override
  _AddressEntryPageState createState() => _AddressEntryPageState();
}

class _AddressEntryPageState extends State<AddressEntryPage> {
  final TextEditingController _billingFullNameController =
      TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();
  final TextEditingController _billingPhoneController = TextEditingController();
  final TextEditingController _billingCityController = TextEditingController();
  final TextEditingController _billingPincodeController =
      TextEditingController();
  final TextEditingController _billingCountryController =
      TextEditingController();

  final TextEditingController _shippingFullNameController =
      TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  final TextEditingController _shippingPhoneController =
      TextEditingController();
  final TextEditingController _shippingCityController = TextEditingController();
  final TextEditingController _shippingPincodeController =
      TextEditingController();
  final TextEditingController _shippingCountryController =
      TextEditingController();

  bool sameAsBilling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address Entry',
          style: TextStyle(
            color: Color.fromRGBO(50, 59, 108, 1),
            fontFamily: 'Gorditas',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Billing Address:',
                  style: TextStyle(
                    fontFamily: 'Pacifo',
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                _buildAddressBox(
                  _billingFullNameController,
                  _billingAddressController,
                  _billingPhoneController,
                  _billingCityController,
                  _billingPincodeController,
                  _billingCountryController,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: sameAsBilling,
                      onChanged: (value) {
                        setState(() {
                          sameAsBilling = value!;
                          if (sameAsBilling) {
                            // Copy values from billing to shipping
                            _shippingFullNameController.text =
                                _billingFullNameController.text;
                            _shippingAddressController.text =
                                _billingAddressController.text;
                            _shippingPhoneController.text =
                                _billingPhoneController.text;
                            _shippingCityController.text =
                                _billingCityController.text;
                            _shippingPincodeController.text =
                                _billingPincodeController.text;
                            _shippingCountryController.text =
                                _billingCountryController.text;
                          } else {
                            // Clear shipping address
                            _shippingFullNameController.text = '';
                            _shippingAddressController.text = '';
                            _shippingPhoneController.text = '';
                            _shippingCityController.text = '';
                            _shippingPincodeController.text = '';
                            _shippingCountryController.text = '';
                          }
                        });
                      },
                    ),
                    const Text('Same as Billing Address'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Shipping Address:',
                  style: TextStyle(
                    fontFamily: 'Pacifo',
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                _buildAddressBox(
                  _shippingFullNameController,
                  _shippingAddressController,
                  _shippingPhoneController,
                  _shippingCityController,
                  _shippingPincodeController,
                  _shippingCountryController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: proceedToPay,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Proceed to Pay'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressBox(
    TextEditingController fullNameController,
    TextEditingController addressController,
    TextEditingController phoneController,
    TextEditingController cityController,
    TextEditingController pincodeController,
    TextEditingController countryController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: fullNameController,
          decoration: const InputDecoration(labelText: 'Full Name'),
        ),
        TextField(
          controller: addressController,
          decoration: const InputDecoration(labelText: 'Address'),
        ),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
        ),
        TextField(
          controller: cityController,
          decoration: const InputDecoration(labelText: 'City Name'),
        ),
        TextField(
          controller: pincodeController,
          decoration: const InputDecoration(labelText: 'Pincode'),
        ),
        TextField(
          controller: countryController,
          decoration: const InputDecoration(labelText: 'Country'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            saveAddress(
              fullNameController.text,
              addressController.text,
              phoneController.text,
              cityController.text,
              pincodeController.text,
              countryController.text,
            );
          },
          child: const Text('Save Address'),
        ),
      ],
    );
  }

  Future<void> saveAddress(
    String fullName,
    String address,
    String phone,
    String city,
    String pincode,
    String country,
  ) async {
    try {
      CollectionReference addresses =
          FirebaseFirestore.instance.collection('addresses');

      Map<String, dynamic> addressData = {
        'fullName': fullName,
        'address': address,
        'phone': phone,
        'city': city,
        'pincode': pincode,
        'country': country,
      };

      await addresses.add(addressData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Address saved successfully!'),
        ),
      );
    } catch (e) {
      print('Error saving address: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error saving address. Please try again.'),
        ),
      );
    }
  }

  void proceedToPay() {
    saveAddress(
      _billingFullNameController.text,
      _billingAddressController.text,
      _billingPhoneController.text,
      _billingCityController.text,
      _billingPincodeController.text,
      _billingCountryController.text,
    );

    if (!sameAsBilling) {
      saveAddress(
        _shippingFullNameController.text,
        _shippingAddressController.text,
        _shippingPhoneController.text,
        _shippingCityController.text,
        _shippingPincodeController.text,
        _shippingCountryController.text,
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
  }
}
